// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:muse/data/providers/auth_state_provider.dart';
import 'package:muse/presentation/sign_in_page/sign_in_page.dart';

class AuthGuard extends ConsumerWidget {
  const AuthGuard({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
      data: (user) {
        if (user == null) {
          // ユーザーが認証されていない場合はログインページにリダイレクト
          return const SignInPage();
        } else {
          // ユーザーが認証されている場合は指定されたウィジェットを表示
          return child;
        }
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}
