import 'package:awesome_notifications/awesome_notifications.dart';

class notify {
  static Future<bool> create_notification(
      String t, String d, int idd, String s) async {
    List time = t.split(":");
    List date = d.split("-");
    final AwesomeNotifications awesomeNotifications = AwesomeNotifications();
    return awesomeNotifications.createNotification(
      content: NotificationContent(
        id: idd,
        title: "Hemoglobin",
        body: "don't forget your test ${Emojis.smile_face_with_open_mouth}",
        channelKey: s,
        notificationLayout: NotificationLayout.Default,
        wakeUpScreen: true,
      ),
      schedule: NotificationCalendar(
        year: int.parse(date[0]),
        month: int.parse(date[1]),
        day: int.parse(date[2]),
        hour: int.parse(time[0]),
        minute: int.parse(time[1]),
        second: 0,
        millisecond: 0,
        repeats: true,
      ),
    );
  }
}
