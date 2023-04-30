// ignore_for_file: prefer_const_constructors,, unused_import

import "package:flutter/material.dart";
import 'package:homeservice/Customer/View/CustomerSignup/Customersignup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'Customer/View/BottomnavScreen/BottomNabBar.dart';
import 'Try/si.dart';
import 'common/auth/signin.dart';
import 'common/routes/routes.dart';
import 'common/Services/app_navigator_service.dart';
import 'common/StartScreen.dart/Splashscreen.dart';

// import 'package:easy_localization/easy_localization.dart';
// Future<void> backgroundHandler(RemoteMessage message) async {
// 	print(message.data.toString());
// print(message.notification!.title);
// }
final themeMode = ValueNotifier(2);
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // // FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  // // await EasyLocalization.ensureInitialized();
  // await Firebase.initializeApp(
  //     //  options: DefaultFirebaseOptions.currentPlatform,
  //     );
  await initialize();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = Routes.getRouter();

    return MaterialApp(
      onGenerateRoute: router.generator,
      navigatorKey: AppNavigatorService.navigatorKey,
      // Remove the debug
      // darkTheme: ThemeData.dark(),
      // themeMode: ThemeMode.values.toList()[value],
      debugShowCheckedModeBanner: false,

      home: StartScreen(),
    );
  }
}
