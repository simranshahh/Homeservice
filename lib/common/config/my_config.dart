class MyConfig {
  static const String appUrl = "http://192.168.1.70:5000";

  // static const apiBaseUrl = 'https://localhost:27017/sajha';
  static const String register = "/api/auth/register";
  static const String signin = "/api/auth/login";
  static const String cusinfo = "/api/auth/getuser";
  static const String allroles = "/api/roles/all";
  static const String logout = "/api/auth/logout";
  static const String placeorder = "/api/booking/new";
  static const String servicestatus = "/booking/mybookings?type=scheduled";

  /// Dont change the code below
  MyConfig._();

  //api methods
}
