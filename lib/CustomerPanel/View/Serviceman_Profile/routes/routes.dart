import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';

import '../../../../Serviceprovider/Dashboard/bottomnavbar.dart';
import '../../../BottomnavScreen/BottomNabBar.dart';

class Routes {
  static FluroRouter getRouter() {
    final router = FluroRouter();

    router.define('bnv',
        handler: Handler(
            handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
                BottomNavScreen()));
    router.define('bnb',
        handler: Handler(
            handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
                Bottomnavbar()));

    return router;
  }
}
