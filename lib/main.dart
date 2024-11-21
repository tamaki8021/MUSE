// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:muse/firebase_options.dart';
import 'core/app_export.dart';

// var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
Future<void> main() async {
  // debugPaintSizeEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();

  // firebaseの初期化
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // firebaseのエミュレーターを使う場合
  if (kDebugMode) {
    try {
      //  FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
      //  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  await Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    PrefUtils().init(),
  ]).then((value) {
    runApp(const ProviderScope(child: App()));
  });
}

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    // final themeType = ref.watch(themeNotifier).themeType;

    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'muse app',
          navigatorKey: NavigatorService.navigatorKey,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizationDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
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
