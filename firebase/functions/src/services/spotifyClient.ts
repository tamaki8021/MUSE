import { logger } from "firebase-functions/v2";
import { CLIENT_ID } from "../config";

export class SpotifyClient {
  /**
   * Spotify APIからアクセストークンとリフレッシュトークンを取得
   */

  async getTokens(code: string, redirectUri: string, codeVerifier: string) {
    const payload = new URLSearchParams({
      client_id: CLIENT_ID,
      grant_type: "authorization_code",
      code,
      redirect_uri: redirectUri,
      code_verifier: codeVerifier,
    });

    const response = await fetch("https://accounts.spotify.com/api/token", {
      method: "POST",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: payload,
    });

    if (!response.ok) {
      logger.error(`Failed to fetch spotify token! status: ${response.status}`);
      throw new Error("Failed to fetch tokens");
    }
    return await response.json();
  }

  /**
   * リフレッシュトークンを使って新しいアクセストークンを取得
   */
  async refreshAccessToken(refreshToken: string) {
    const payload = new URLSearchParams({
      client_id: CLIENT_ID,
      grant_type: "refresh_token",
      refresh_token: refreshToken,
    });

    const response = await fetch("https://accounts.spotify.com/api/token", {
      method: "POST",
      headers: { "Content-Type": "application/x-www-form-urlencoded" },
      body: payload,
    });

    if (!response.ok) {
      logger.error(`Failed to refresh token: ${response.status}`);
      throw new Error("Failed to refresh token");
    }

    const tokenData = await response.json();
    return tokenData; // 新しいアクセストークンとリフレッシュトークンを返す
  }

  /**
   * Spotifyのユーザープロフィール情報を取得
   */
  async getUserProfile(accessToken: string) {
    const response = await fetch("https://api.spotify.com/v1/me", {
      headers: {
        Authorization: `Bearer ${accessToken}`,
      },
    });

    if (!response.ok) {
      logger.error(`Failed to fetch user spotify profile status: ${response.status}`);
      throw new Error("Failed to fetch user profile");
    }
    return await response.json();
  }
}
