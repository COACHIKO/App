import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter/cupertino.dart';

final FlutterLocalNotificationsPlugin notificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> initializeNotifications() async {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/launcher_icon');

  final InitializationSettings initializationSettings =
  const InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: null,
  );

  await notificationsPlugin.initialize(initializationSettings);
}
TimeOfDay selectedTime = TimeOfDay.now();

Future<void> scheduleNotification({
  required DateTime scheduledDateTime,
  required String notificationTitle,
  required String notificationBody,
}) async {
  final tz.TZDateTime scheduledDate =
  tz.TZDateTime.from(scheduledDateTime, tz.local);

  if (scheduledDate.isBefore(tz.TZDateTime.now(tz.local))) {
    final tz.TZDateTime tomorrow = tz.TZDateTime(
        tz.local,
        scheduledDateTime.year,
        scheduledDateTime.month,
        scheduledDateTime.day + 1,
        selectedTime.hour,
        selectedTime.minute);

    await notificationsPlugin.zonedSchedule(
      0,
      notificationTitle,
      notificationBody,
      tomorrow,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_notification',
          'Daily Notification',
          importance: Importance.max,
          ticker: 'ticker',

          channelDescription: 'Daily Notification',

        ),
      ),
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      payload: 'Daily Notification',
      matchDateTimeComponents: DateTimeComponents.time,
    );
  } else {
    await notificationsPlugin.zonedSchedule(
      0,
      notificationTitle,
      notificationBody,
      scheduledDate,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_notification',
          'Daily Notification',
          importance: Importance.max,
          ticker: 'ticker',
          channelDescription: 'Daily Notification',
        ),
      ),
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      payload: 'Daily Notification',
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

}

Future<void> selectTime(BuildContext context) async {
  TimeOfDay? selectedTimeOfDay = selectedTime;
  DateTime selectedDateTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    selectedTimeOfDay.hour,
    selectedTimeOfDay.minute,
  );

  DateTime? picked = await showModalBottomSheet<DateTime>(
    context: context,
    builder: (BuildContext builder) {
      return Container(
        height: 250.h,
        child: Column(
          children: [
            Container(
              height: 200.h,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                initialDateTime: selectedDateTime,
                onDateTimeChanged: (DateTime newDateTime) {
                  selectedDateTime = newDateTime;
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).pop(selectedDateTime);
                  },
                  child: Text('Save', style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)),
                ),
                CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).pop(null); // Cancel
                  },
                  child: Text('Cancel', style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );

  if (picked != null) {
    final now = DateTime.now();
    scheduleNotification(
      scheduledDateTime: picked,
      notificationTitle: 'Daily Weight Reminder',
      notificationBody: 'Your daily log is waiting for you',
    );
  } else {
    // Action to perform when "Cancel" is pressed or no time is selected.
  }
}









Future<void> getScheduledNotifications() async {
  final List<PendingNotificationRequest> pendingNotifications =
  await notificationsPlugin.pendingNotificationRequests();

  for (var notification in pendingNotifications) {
    print('Scheduled Notification: ${notification.id} - ${notification.title}  - ${notification.body}');
    // You can access other properties of the notification like content, payload, etc.
  }


}
Future<void> cancelAllScheduledNotifications() async {
  await notificationsPlugin.cancelAll();
}