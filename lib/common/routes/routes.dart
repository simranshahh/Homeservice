import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import '../../Serviceprovider/Dashboard/bottomnavbar.dart';
import '../../Customer/View/BottomnavScreen/BottomNabBar.dart';
import '../auth/signin.dart';

class Routes {
  static FluroRouter getRouter() {
    final router = FluroRouter();

    router.define('bnv',
        handler: Handler(
            handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
                const BottomNavScreen()));
    router.define('bnb',
        handler: Handler(
            handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
                const Bottomnavbar()));

    router.define('Signin',
        handler: Handler(
            handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
                const Signin()));

    return router;
  }
}
