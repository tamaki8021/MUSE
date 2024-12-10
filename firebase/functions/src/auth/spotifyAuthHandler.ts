import { onRequest } from "firebase-functions/v2/https";
import * as logger from "firebase-functions/logger";
import { SpotifyClient } from "../services/spotifyClient";
import { createFirebaseAccount } from "../services/firebaseTokenManager";

export const spotifyAuth = onRequest(async (req, res) => {
  const { code, redirectUri, codeVerifier } = req.body.data;

  if (!code || !redirectUri || !codeVerifier) {
    logger.error("Invalid input: Missing parameters");
    res.status(400).jsonp({ error: "Invalid parameters" });
  }

  try {
    const spotifyClient = new SpotifyClient();

    const data = await spotifyClient.getTokens(code, redirectUri, codeVerifier);
    const accessToken = data.access_token;
    const refreshToken = data.refresh_token;
    logger.log("Received Access Token:", accessToken);
    logger.log("Received Refresh Token:", refreshToken);

    const userInfo = await spotifyClient.getUserProfile(accessToken);

    const firebaseToken = await createFirebaseAccount(
      userInfo.id,
      userInfo.display_name,
      userInfo.images?.[0]?.url || "",
      userInfo.email,
      accessToken,
      refreshToken,
    );

    res.jsonp({ token: firebaseToken });
  } catch (error: any) {
    logger.error("Spotify auth failed", error);
    res.status(500).send({ error: "Authentication failed" });
  }
});
