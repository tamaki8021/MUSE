import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hibiki_tamaki_s_application1/firebase_options.dart';
import 'package:hibiki_tamaki_s_application1/repositories/firebase_auth_repository_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'core/app_export.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // リンクからアプリへ遷移するとき、アプリが開いていないと発動
  await FirebaseDynamicLinks.instance.getInitialLink().then((data) async {
    final String? deepLink = data?.link.toString();
    // メールアドレスの入力がない場合はスキップ
    final email = 'hbk14320@gmail.com';
    final auth = FirebaseAuth.instance;

    print(data);
    print('deepLink');
    print(deepLink);
    if (deepLink == null) return;
    if (auth.isSignInWithEmailLink(deepLink)) {
      // メールリンクに含まれる認証情報でサインイン
      // 成功したらFirebase Authenticationにユーザーを作成（すでに存在する場合はログインのみ）
      await auth
          .signInWithEmailLink(email: email, emailLink: deepLink)
          .then((credential) {
        // TODO: Firestoreへuserを登録する(既に存在している場合は行わない)
        // You can access the new user via userCredential.user.
        final emailAddress = credential.user?.email;
        print(emailAddress);
      });
    }
    print('nitiallink');
  }).catchError((e) {
    print(e);
  });
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    PrefUtils().init()
  ]).then((value) {
    runApp(ProviderScope(child: MyApp()));
  });
}

class MyApp extends HookConsumerWidget {
  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final themeType = ref.watch(themeNotifier).themeType;

    useEffect(() {
      // リンクからアプリへ遷移するとき、アプリが開いていると発動
      final onLinkSubscription = FirebaseDynamicLinks.instance.onLink.listen(
        (pendingDynamicLinkData) async {
          final result = await ref
              .read(firebaseAuthRepositoryProvider)
              .verifyDynamicLink(pendingDynamicLinkData);
          print(result);
        },
      );

      // ウィジェットが破棄されるときにリッスンをキャンセルする
      return onLinkSubscription.cancel;
    }, const []);

    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'hibiki_tamaki_s_application1',
          navigatorKey: NavigatorService.navigatorKey,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            AppLocalizationDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale(
              'en',
              '',
            ),
          ],
          initialRoute: AppRoutes.initialRoute,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
