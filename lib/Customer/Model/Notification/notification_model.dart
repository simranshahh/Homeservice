// ignore_for_file: camel_case_types

class Notification_items {
  String image;
  String title;
  String subtitle;
  String date;

  Notification_items(
      {required this.image,
      required this.title,
      required this.subtitle,
      required this.date});
}

class AdminNotification {
  String heading;
  String subheading;
  String time;

  AdminNotification(
      {required this.heading, required this.subheading, required this.time});
}
