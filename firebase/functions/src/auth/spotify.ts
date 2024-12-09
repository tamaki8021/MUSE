import * as admin from "firebase-admin";

import { onRequest } from "firebase-functions/v2/https";
import logger = require("firebase-functions/logger");

const CLIENT_ID = "82116608e5954ed19c9671e802b2ace4";

export const spotifyAuth = onRequest(async (req, res) => {
  const { code, redirectUri, codeVerifier } = req.body.data;

  try {
    const payload = {
      method: "POST",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: new URLSearchParams({
        client_id: CLIENT_ID,
        grant_type: "authorization_code",
        code,
        redirect_uri: redirectUri,
        code_verifier: codeVerifier,
      }),
    };

    fetch("https://accounts.spotify.com/api/token", payload)
      .then(async (response) => {
        if (!response.ok) {
          logger.error(`HTTP error! status: ${response.status}`);
          res.send(`HTTP error! status: ${response.status}`)
        }
        const data = await response.json();
        const accessToken = data.access_token;
        logger.log("Received Access Token:", accessToken);
        logger.log("Received Refresh Token:", data.refresh_token);

        // アクセストークンを使ってSpotify APIにリクエスト
        const userInfoResponse = await fetch("https://api.spotify.com/v1/me", {
          headers: { Authorization: `Bearer ${accessToken}` },
        });
        if (!userInfoResponse.ok) {
          logger.error(`HTTP error! status: ${userInfoResponse.status}`);
          res.send(`HTTP error! status: ${userInfoResponse.status}`)
        }
        const userResults = await userInfoResponse.json();
        logger.log("Auth code exchange result received:", userResults);
        const spotifyUserID = userResults["id"];
        const profilePic = userResults["images"][0]["url"];
        const userName = userResults["display_name"];
        const email = userResults["email"];

        // Create a Firebase account and get the Custom Auth Token.
        const firebaseToken = await createFirebaseAccount(
          spotifyUserID,
          userName,
          profilePic,
          email,
          accessToken
        );
        res.jsonp({ data: firebaseToken });
      })
      .catch((err) => {
        logger.error("Error fetching access token:", err);
      });
  } catch (error: any) {
    logger.error("Error during Spotify token exchange:", error);
    res.status(500).jsonp({ data: error.toString() });
  }
  return;
});

/**
 * Creates a Firebase account with the given user profile and returns a custom auth token allowing
 * signing-in this account.
 * Also saves the accessToken to the datastore at /spotifyAccessToken/$uid
 *
 * @returns {Promise<string>} The Firebase custom auth token in a promise.
 */
const createFirebaseAccount = async (
  spotifyID: string,
  displayName: string,
  photoURL: string,
  email: string,
  accessToken: string
) => {
  // The UID we'll assign to the user.
  const uid = `spotify:${spotifyID}`;

  // Save the access token to the Firebase Realtime Database.
  const databaseTask = admin
    .database()
    .ref(`/spotifyAccessToken/${uid}`)
    .set(accessToken);

  // Create or update the user account.
  const userCreationTask = admin
    .auth()
    .updateUser(uid, {
      displayName: displayName,
      photoURL: photoURL,
      email: email,
      emailVerified: true,
    })
    .catch((error) => {
      // If user does not exists we create it.
      if (error.code === "auth/user-not-found") {
        return admin.auth().createUser({
          uid: uid,
          displayName: displayName,
          photoURL: photoURL,
          email: email,
          emailVerified: true,
        });
      }
      throw error;
    });

  // Wait for all async tasks to complete, then generate and return a custom auth token.
  await Promise.all([userCreationTask, databaseTask]);
  // Create a Firebase custom auth token.
  const token = await admin.auth().createCustomToken(uid);
  logger.log('Created Custom token for UID "', uid, '" Token:', token);
  return token;
};
