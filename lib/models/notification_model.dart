enum NotificationType {
  payment,
  loan,
  general,
}

class AppNotification {
  final String id;
  final String title;
  final String message;
  final DateTime date;
  final NotificationType type;
  bool isRead;
  final String? actionUrl;

  AppNotification({
    required this.id,
    required this.title,
    required this.message,
    required this.date,
    required this.type,
    this.isRead = false,
    this.actionUrl,
  });

  factory AppNotification.fromJson(Map<String, dynamic> json) {
    return AppNotification(
      id: json['id'],
      title: json['title'],
      message: json['message'],
      date: DateTime.parse(json['date']),
      type: NotificationType.values[json['type']],
      isRead: json['isRead'],
      actionUrl: json['actionUrl'],
    );
  }



