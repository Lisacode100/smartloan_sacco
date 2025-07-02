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

