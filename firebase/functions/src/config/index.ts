import * as functions from "firebase-functions";

export const CLIENT_ID = functions.config().spotify.client_id;

console.log("CLIENT_ID", CLIENT_ID);
