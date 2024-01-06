import 'package:flutter/material.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool pushNotification = true;
  bool emailNotification = true;

  buildNotificationCard(
      {required String title,
      required String subTitle,
      required bool isSelected,
      required Function onTap}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
      child: ListTile(
        tileColor: Colors.white,
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(subTitle),
        trailing: Switch(
            value: isSelected,
            onChanged: (val) {
              onTap();
              setState(() {});
            }),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification settings"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            buildNotificationCard(
                isSelected: pushNotification,
                title: "Push notification",
                subTitle: "Receive Important push notification",
                onTap: () {
                  pushNotification = !pushNotification;
                }),
            buildNotificationCard(
                isSelected: emailNotification,
                title: "Email notification",
                subTitle: "Receive Important email notification",
                onTap: () {
                  emailNotification = !emailNotification;
                }),
          ],
        ),
      ),
    );
  }
}
