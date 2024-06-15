import '../models/notification_model.dart';
import '../services/notifications_service.dart';

class NotificationsRespository {
  NotificationsRespository(this.notificationsService);

  final NotificationsService notificationsService;
  static DateTime _lastUpdate = DateTime.now().toUtc();
  static const maxTimeCache = 1;

  static List<Notification> _cacheList = <Notification>[];

  void clearCache() {
    _cacheList.clear();
  }

  Future<List<Notification>> getNotifications() async {
    if (_cacheList.isEmpty ||
        DateTime.now().toUtc().difference(_lastUpdate).inMinutes >
            maxTimeCache) {
      _cacheList = await notificationsService.getMyNotifications();
      _lastUpdate = DateTime.now().toUtc();
    }
    return _cacheList;
  }

  Future<bool> deleteNotification(String notificationId) async {
    if (_cacheList.any((element) => element.id == notificationId)) {
      _cacheList.remove(
          _cacheList.where((element) => element.id == notificationId).first);
    }
    return notificationsService.deleteNotification(notificationId);
  }

  Future<Notification?> getNotification(String notificationId) async {
    if (_cacheList.any((element) => element.id == notificationId)) {
      return _cacheList.where((element) => element.id == notificationId).first;
    }
    return notificationsService.getNotification(notificationId);
  }
}
