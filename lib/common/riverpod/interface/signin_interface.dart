import 'package:flutter/cupertino.dart';

import '../../../Customer/Model/Home/usermodel.dart';

abstract class IUserRepository {
  Future<Signininfo?> signin(
      String email, String password, BuildContext context);
  Future logout();
}
