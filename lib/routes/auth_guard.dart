// auth_guard.dart

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:muse/data/providers/auth_state_provider.dart';
import 'package:muse/presentation/sign_in_page/sign_in_page.dart';

import 'package:muse/core/app_export.dart'; // 必要なプロバイダーのインポート

class AuthGuard extends ConsumerWidget {
  const AuthGuard({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
      data: (user) {
        if (user == null) {
          return const SignInPage();
        } else {
          // ユーザーが認証されている場合は指定されたウィジェットを表示
          return child;
        }
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => Scaffold(
        body: Center(child: Text('Error: $error')),
      ),
    );
  }
}
