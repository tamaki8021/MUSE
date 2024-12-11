enum FirebaseAuthErrorType {
  userNotFound,
  userDisabled,
  requiresRecentLogin,
  emailAlreadyInUse,
  invalidEmail,
  wrongPassword,
  tooManyRequests,
  expiredActionCode,
  unknown,
}

extension FirebaseAuthErrorExt on FirebaseAuthErrorType {
  /// 表示用メッセージ取得
  String get message => _messages[this]!;

  /// 表示用メッセージ一覧
  static final _messages = {
    FirebaseAuthErrorType.userNotFound: '指定されたユーザーは登録されていません。',
    FirebaseAuthErrorType.userDisabled: '指定されたユーザーは無効化されています。',
    FirebaseAuthErrorType.requiresRecentLogin:
        'アカウント削除などのセキュアな操作を行うにはログインによる再認証が必要です。',
    FirebaseAuthErrorType.emailAlreadyInUse: '既に利用されているメールアドレスです。',
    FirebaseAuthErrorType.invalidEmail: '無効なメールアドレスです。',
    FirebaseAuthErrorType.wrongPassword: 'メールアドレス、またはパスワードが間違っています。',
    FirebaseAuthErrorType.tooManyRequests: 'アクセスが集中しています。少し時間を置いてから再度お試しください。',
    FirebaseAuthErrorType.expiredActionCode:
        'メールアドレスリンクの期限が切れています。再度認証メールを送信してください。',
    FirebaseAuthErrorType.unknown: '予期しないエラーが発生しました。',
  };

  /// エラーコード(FIRAuth)から独自定義に変換
  static FirebaseAuthErrorType fromCode(String code) {
    switch (code) {
      case 'user-not-found':
        return FirebaseAuthErrorType.userNotFound;
      case 'user-disabled':
        return FirebaseAuthErrorType.userDisabled;
      case 'requires-recent-login':
        return FirebaseAuthErrorType.requiresRecentLogin;
      case 'email-already-in-use':
        return FirebaseAuthErrorType.emailAlreadyInUse;
      case 'invalid-email':
        return FirebaseAuthErrorType.invalidEmail;
      case 'wrong-password':
        return FirebaseAuthErrorType.wrongPassword;
      case 'too-many-requests':
        return FirebaseAuthErrorType.tooManyRequests;
      case 'expired-action-code':
        return FirebaseAuthErrorType.expiredActionCode;
      default:
        return FirebaseAuthErrorType.unknown;
    }
  }
}
