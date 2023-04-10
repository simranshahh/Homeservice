// ignore_for_file: prefer_const_constructors,, unused_import

import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:homeservice/CustomerPanel/BottomnavScreen/BottomNabBar.dart';
import 'package:homeservice/Serviceprovider/Dashboard/Dashboard/Ratings.dart';
import 'package:homeservice/Serviceprovider/Dashboard/bottomnavbar.dart';
import 'package:homeservice/CustomerPanel/View/Bookings/current/current.dart';
import 'package:homeservice/CustomerPanel/View/Bookings/scheduled_booking.dart';
import 'package:homeservice/CustomerPanel/View/Home/Homepage.dart';
import 'package:homeservice/CustomerPanel/View/Notifications/notification.dart';
import 'package:homeservice/CustomerPanel/View/Notifications/notification_detail.dart';
import 'package:homeservice/CustomerPanel/View/Serviceman_Profile/Serviceman_Profile.dart';
import 'package:homeservice/CustomerPanel/View/Settings/Edit_Profile.dart';
import 'package:homeservice/CustomerPanel/View/SignIn/customersignin.dart';
import 'package:homeservice/CustomerPanel/View/SignIn/servicemansignin.dart';
import 'package:homeservice/CustomerPanel/View/SignIn/signin.dart';
import 'package:homeservice/CustomerPanel/View/Signup/signup.dart';
import 'package:homeservice/CustomerPanel/View/StartScreen.dart/Welcome.dart';
import 'package:homeservice/CustomerPanel/View/StartScreen.dart/onboarding_example.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import 'CustomerPanel/View/Serviceman_Profile/routes/routes.dart';
import 'CustomerPanel/View/StartScreen.dart/Splashscreen.dart';
import 'Serviceprovider/Dashboard/Book/CurrentPanel/Currentpanel.dart';
import 'Serviceprovider/Dashboard/Dashboard/Aboutus.dart';
import 'Serviceprovider/Dashboard/Dashboard/reviews.dart';
import 'CustomerPanel/View/ForgetPassword.dart';
import 'CustomerPanel/View/Serviceman_Profile/rate.dart';
import 'CustomerPanel/View/Settings/customerprofile.dart';
import 'CustomerPanel/View/Signup/Customersignup.dart';
import 'CustomerPanel/View/Signup/ServicemanSignup.dart';

// import 'package:easy_localization/easy_localization.dart';
// Future<void> backgroundHandler(RemoteMessage message) async {
// 	print(message.data.toString());
// print(message.notification!.title);
// }
final themeMode = ValueNotifier(2);
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  // await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
      //  options: DefaultFirebaseOptions.currentPlatform,
      );
  await initialize();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final router = Routes.getRouter();

    return ValueListenableBuilder(
        valueListenable: themeMode,
        builder: (context, value, g) {
          return MaterialApp(
            // Remove the debug
            // darkTheme: ThemeData.dark(),
            // themeMode: ThemeMode.values.toList()[value],
            debugShowCheckedModeBanner: false,

            home: StartScreen(),
          );
        });
  }
}
