// ignore_for_file: prefer_const_constructors,

import "package:flutter/material.dart";
import 'package:homeservice/Bottomnavbar/BottomNabBar.dart';
import 'package:homeservice/View/Hire/Hirepage.dart';
import 'package:homeservice/View/Profile/Serviceman_Profile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

// import 'package:easy_localization/easy_localization.dart';

import 'services/app_navigator_service.dart';

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
            home: BottomNavScreen(),
          );
        });
  }
}
