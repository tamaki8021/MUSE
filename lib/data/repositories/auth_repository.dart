// Dart imports:
import 'dart:convert';
import 'dart:math';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:muse/core/extensions/firebase_auth_error_type_extension.dart';
import 'package:muse/core/libs/firebase.dart';

final authRepositoryProvider = Provider(AuthRepositoryImpl.new);
const clientId = '82116608e5954ed19c9671e802b2ace4';
const redirectUri = 'com.muse.muse://callback';
const scopes = 'user-read-private user-read-email';

abstract class AuthRepository {
  Stream<User?> get authStateChanged;
  User? get currentUser;
  Future<String> spotifySignIn();
  Future<String> signOut();
}

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this.ref);

  final Ref ref;

  @override
  Stream<User?> get authStateChanged =>
      ref.read(firebaseAuth).authStateChanges();

  @override
  User? get currentUser => ref.read(firebaseAuth).currentUser;

  String generateRandomString(int length) {
    const possible =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random.secure();
    final values = List<int>.generate(length, (i) => random.nextInt(256));
    return values.map((x) => possible[x % possible.length]).join();
  }

  Future<String> generateCodeChallenge(String plain) async {
    final bytes = utf8.encode(plain);
    final digest = sha256.convert(bytes);
    return base64UrlEncode(digest.bytes)
        .replaceAll('=', '')
        .replaceAll('+', '-')
        .replaceAll('/', '_');
  }

  @override
  Future<String> spotifySignIn() async {
    try {
      final codeVerifier = generateRandomString(64);
      final codeChallenge = await generateCodeChallenge(codeVerifier);

      final authUrl = Uri.https('accounts.spotify.com', '/authorize', {
        'client_id': clientId,
        'response_type': 'code',
        'redirect_uri': redirectUri,
        'scope': scopes,
        'code_challenge_method': 'S256',
        'code_challenge': codeChallenge,
      });

      final result = await FlutterWebAuth.authenticate(
        url: authUrl.toString(),
        callbackUrlScheme: 'com.muse.muse',
      );

      final code = Uri.parse(result).queryParameters['code'];
      if (kDebugMode) {
        print('Authorization code: $code');
      }

      final resultSpotifySignIn = await ref
          .read(firebaseFunctions)
          .httpsCallable('spotifyAuth')
          .call<String>({
        'code': code,
        'codeVerifier': codeVerifier,
        'redirectUri': redirectUri,
      });
      final firebaseToken = resultSpotifySignIn.data;
      if (kDebugMode) {
        print(firebaseToken);
      }
      await ref.read(firebaseAuth).signInWithCustomToken(firebaseToken);
      return 'success';
    } on FirebaseAuthException catch (e) {
      return FirebaseAuthErrorExt.fromCode(e.code).message;
    }
  }

  @override
  Future<String> signOut() async {
    try {
      await ref.read(firebaseAuth).signOut();

      return 'success';
    } on FirebaseAuthException catch (e) {
      return FirebaseAuthErrorExt.fromCode(e.code).message;
    }
  }
}
