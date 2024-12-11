import * as admin from "firebase-admin";
import { logger } from "firebase-functions/v2";

export const createFirebaseAccount = async (
  spotifyID: string,
  displayName: string,
  photoURL: string,
  email: string,
  accessToken: string,
  refreshToken: string,
) => {
  // The UID we'll assign to the user.
  const uid = `spotify:${spotifyID}`;

  // Save the access token to the Firebase Realtime Database.
  const databaseTask = admin
    .database()
    .ref(`/spotifyAccessToken/${uid}`)
    .set({accessToken: accessToken, refreshToken: refreshToken});

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
      logger.error(error);
      throw error;
    });

  // Wait for all async tasks to complete, then generate and return a custom auth token.
  await Promise.all([userCreationTask, databaseTask]);
  // Create a Firebase custom auth token.
  const token = await admin.auth().createCustomToken(uid);
  logger.log('Created Custom token for UID "', uid, '" Token:', token);
  return token;
};
