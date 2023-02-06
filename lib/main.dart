// ignore_for_file: prefer_const_constructors,, unused_import

import "package:flutter/material.dart";
import 'package:homeservice/Bottomnavbar/BottomNabBar.dart';
import 'package:homeservice/View/Bookings/scheduled_booking.dart';
import 'package:homeservice/View/Home/Homepage.dart';
import 'package:homeservice/View/Notifications/notification.dart';
import 'package:homeservice/View/Notifications/notification_detail.dart';
import 'package:homeservice/View/Serviceman_Profile/Serviceman_Profile.dart';
import 'package:homeservice/View/Settings/Edit_Profile.dart';
import 'package:homeservice/View/SignIn/customersignin.dart';
import 'package:homeservice/View/SignIn/signin.dart';
import 'package:homeservice/View/Signup/signup.dart';
import 'package:homeservice/View/StartScreen.dart/Welcome.dart';
import 'package:homeservice/View/StartScreen.dart/onboarding_example.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import 'View/ForgetPassword.dart';
import 'View/Settings/Serviceman_Profile.dart';
import 'View/Settings/customerprofile.dart';
import 'View/Signup/Customersignup.dart';
import 'View/Signup/ServicemanSignup.dart';

// import 'package:easy_localization/easy_localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await EasyLocalization.ensureInitialized();

  await initialize();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            // Remove the debug banner
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.amber),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            home: Serviceman_setting(),
          );
        });
  }
}
