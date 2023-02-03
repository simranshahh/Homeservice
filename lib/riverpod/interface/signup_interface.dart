import 'package:flutter/cupertino.dart';

import '../models/signup_model.dart';

abstract class ISignupRepository {
  Future<SignupClass?> Register(
      String name,
      String surname,
      String username,
      String emailAddress,
      String password,
      String phoneNumber,
      BuildContext context);
}
