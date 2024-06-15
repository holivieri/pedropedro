import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart';

import '../repositories/notifications_repository.dart';
import '../services/notifications_service.dart';
import '../utils/font.dart';
import '../widgets/back_button.dart';

class NotificationDetailPage extends StatefulWidget {
  const NotificationDetailPage({
    required this.notificationId,
    Key? key,
  }) : super(key: key);
  final String notificationId;

  @override
  State<NotificationDetailPage> createState() => _NotificationDetailPageState();
}

class _NotificationDetailPageState extends State<NotificationDetailPage> {
  String _title = '';
  String _message = '';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadNotificationInfo();
    });
    super.initState();
  }

  Future<void> loadNotificationInfo() async {
    final repo = NotificationsRespository(NotificationsService(Client()));
    final notification = await repo.getNotification(widget.notificationId);
    _title = notification!.title;
    _message = notification.message;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackArrowButton(),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        // decoration: const BoxDecoration(gradient: themeBackgroundGradient),
        child: mainBody(),
      ),
    );
  }

  Widget mainBody() {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const SizedBox(height: 100),
              title(),
              const SizedBox(height: 20),
              message(),
            ],
          ),
        ),
      ),
    );
  }

  Widget title() {
    final TextEditingController txt = TextEditingController()..text = _title;

    return TextField(
      readOnly: true,
      controller: txt,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: AppLocalizations.of(context)!.title,
        labelStyle: titleStyle,
      ),
    );
  }

  Widget message() {
    final TextEditingController txt = TextEditingController()..text = _message;

    return TextField(
      readOnly: true,
      controller: txt,
      maxLines: 10,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: AppLocalizations.of(context)!.message,
        labelStyle: titleStyle,
      ),
    );
  }
}
