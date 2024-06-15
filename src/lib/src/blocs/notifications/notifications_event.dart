part of 'notifications_bloc.dart';

abstract class NotificationsEvent {}

class GettingUserNotifications extends NotificationsEvent {}

class DeletingNotification extends NotificationsEvent {
  DeletingNotification(this.notificationId);

  final String notificationId;
}
