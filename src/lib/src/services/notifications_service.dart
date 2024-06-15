import 'dart:convert';

import 'package:http/http.dart';

import '../models/notification_model.dart';
import '../utils/http.dart';

class NotificationsService {
  NotificationsService(this._client);

  final Client _client;

  Future<List<Notification>> getMyNotifications() async {
    final apiResponse = await _client.get(
      Uri.parse('$apiUrl/User/GetNotifications'),
      headers: returnHttpHeaders(),
    );

    if (apiResponse.statusCode != 200) {
      assert(
        apiResponse.statusCode == 200,
        'Notifications endpoint is NOT working',
      );
      return [];
    }

    final List decodedResponse = json.decode(
      apiResponse.body,
    );

    return [
      for (final Map<String, dynamic> record in decodedResponse)
        Notification.fromJson(record)
    ];
  }

  Future<Notification?> getNotification(String notificationId) async {
    final apiResponse = await _client.get(
      Uri.parse('$apiUrl/User/GetNotification/$notificationId'),
      headers: returnHttpHeaders(),
    );

    if (apiResponse.statusCode != 200) {
      return null;
    }

    final decodedResponse = json.decode(
      apiResponse.body,
    );

    return Notification.fromJson(decodedResponse);
  }

  Future<bool> deleteNotification(String notificationId) async {
    final apiResponse = await _client.post(
      Uri.parse(
          '$apiUrl/User/DeleteNotification?notificationId=$notificationId'),
      headers: returnHttpHeaders(),
    );

    if (apiResponse.statusCode != 200) {
      return false;
    }
    return true;
  }
}
