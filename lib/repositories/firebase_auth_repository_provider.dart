// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:muse/core/utils/pref_utils.dart';

abstract class FirebaseAuthRepository {
  Future<String> sendSignInLink({required String email});
  Future<dynamic> verifyDynamicLink(PendingDynamicLinkData? data);
  Future<String> signOut();
}

final firebaseAuthRepositoryProvider = Provider<FirebaseAuthRepositoryImpl>(
  (ref) => FirebaseAuthRepositoryImpl(ref),
);

class FirebaseAuthRepositoryImpl implements FirebaseAuthRepository {
  const FirebaseAuthRepositoryImpl(this.ref);

  final Ref ref;

  @override
  Future<String> sendSignInLink({required String email}) async {
    final acs = ActionCodeSettings(
      // URL you want to redirect back to. The domain (www.example.com) for this
      // URL must be whitelisted in the Firebase Console.
      url: 'https://devmuse.page.link/emailLink',
      // This must be true
      handleCodeInApp: true,
      iOSBundleId: 'com.muse.muse',
      androidPackageName: 'com.muse.app',
      // installIfNotAvailable
      androidInstallApp: true,
      // minimumVersion
      androidMinimumVersion: '12',
    );

    try {
      await FirebaseAuth.instance
          .sendSignInLinkToEmail(email: email, actionCodeSettings: acs)
          // メールリンクの送信に成功したあと、メールアドレスを永続層（SharedPreferences）に保持
          .then((_) => PrefUtils().set('email', email));

      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.message ?? '';
    }
  }

  /// メールリンクの検証にのみ利用
  @override
  Future<dynamic> verifyDynamicLink(PendingDynamicLinkData? data) async {
    final auth = FirebaseAuth.instance;
    // すでにSigninしている場合はスキップ
    // if (currentUser != null) return;
    // メールアドレスの入力がない場合はスキップ
    final email = PrefUtils().get('email') as String?;
    if (email == null) {
      return;
    }

    final deepLink = data?.link.toString();
    if (deepLink == null) {
      return;
    }

    try {
      // リンク（＝URL）が、メールリンクかどうか検証
      if (auth.isSignInWithEmailLink(deepLink)) {
        // メールリンクに含まれる認証情報でサインイン
        // 成功したらFirebase Authenticationにユーザーを作成（すでに存在する場合はログインのみ）
        await auth
            .signInWithEmailLink(email: email, emailLink: deepLink)
            .then((credential) {
          // TODO(tamaki8021): Firestoreへuserを登録する(既に存在している場合は行わない), 2024/05/17
          // You can access the new user via userCredential.user.
          // final emailAddress = credential.user?.email;
        });
      }
      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.message ?? '';
    }
  }

  @override
  Future<String> signOut() async {
    try {
      await FirebaseAuth.instance
          .signOut()
          // 同時にメールアドレスも永続層（SharedPreferences）から削除
          .then((_) => PrefUtils().remove('email'));

      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.message ?? '';
    }
  }
}
