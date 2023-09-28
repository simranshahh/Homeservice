class MyConfig {
  static const String appUrl = "http://192.168.10.32:5000";

  // static const apiBaseUrl = 'https://localhost:27017/sajha';
  static const String register = "/api/auth/register";
  static const String signin = "/api/auth/login";
  static const String cusinfo = "/api/auth/getuser";
  static const String allroles = "/api/roles/all";
  static const String logout = "/api/auth/logout";
  static const String placeorder = "/api/booking/new";
  // static const String servicestatus = "/booking/mybookings?type=scheduled";
  static const String addrating = "/api/booking/addrating";
  static const String updateBookingStatus = "/api/booking/update";
  static const String notification = "/api/auth/notifications";
  static const String cancelbooking = "/api/booking/cancel";

  /// Dont change the code below
  MyConfig._();

  //api methods
}
