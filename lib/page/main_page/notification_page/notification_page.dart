 import 'package:flutter/material.dart';

import '../../../constants/app_constants.dart';
import '../../../model/widget_model/notification_model.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    buildCard({required NotificationModel notification}) {
      List<IconData> iconList = [
        Icons.time_to_leave_outlined,
        Icons.card_giftcard_outlined,
        Icons.offline_bolt_outlined,
        Icons.access_alarm
      ];
      return Padding(
        padding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
        child: ListTile(
          leading: Icon(iconList[notifications.indexOf(notification)%4]),
          tileColor: Colors.white,
          title: Text(notification.subtitle),
          subtitle: Text(notification.message),
          trailing:
              Text(AppConstants.timeAgo(dateTime: notification.createdAt)),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 12,),
              ...notifications
                  .map((notification) => buildCard(notification: notification))
                  .toList()
            ],
          ),
        ),
      ),
    );
  }
}

