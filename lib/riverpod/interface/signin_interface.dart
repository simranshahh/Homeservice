import 'package:flutter/cupertino.dart';

import '../../Model/Home/usermodel.dart';

abstract class IUserRepository {
  Future<Logininfo?> logIn(
      String email, String password, String tenantname, BuildContext context);
}
