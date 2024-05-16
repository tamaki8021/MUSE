import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:muse/repositories/firebase_auth_repository_provider.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const email = 'hbk14320@gmail.com';
    return Scaffold(
      appBar: AppBar(
        title: const Text('login'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () async {
              await ref
                  .read(firebaseAuthRepositoryProvider)
                  .sendSignInLink(email: email);
            },
            child: const Text('send email'),
          ),
        ],
      ),
    );
  }
}
