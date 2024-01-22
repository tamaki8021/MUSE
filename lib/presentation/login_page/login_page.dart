import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hibiki_tamaki_s_application1/repositories/firebase_auth_repository_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const email = 'hbk14320@gmail.com';
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
      ),
      body: Column(children: [
        TextButton(
            onPressed: () async {
              await ref
                  .read(firebaseAuthRepositoryProvider)
                  .sendSignInLink(email: email);
              print('送信しました。');
            },
            child: Text('send email'))
      ]),
    );
  }
}
