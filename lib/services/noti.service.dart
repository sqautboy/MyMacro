import 'package:diet_macro/models/isar_data.dart';
import 'package:diet_macro/services/isar.service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  // create instance
  static final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();

  // initialize notifications
  Future<void> initNotification() async {
    await notificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/launcher_icon'),
        iOS: DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        ),
      ),
    );
    await configureLocalTimeZone();
  }

  // 사용자 시간대 설정
  Future<void> configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  // 특정 시간대 알람 설정
  Future<void> scheduleDailyNotification() async {
    // 오늘 날짜의 DailyData와 TargetData 가져오기
    final TargetData? targetData = await IsarService().getTargetData();
    final DailyData? dailyData =
        await IsarService().getDailyDataByDate(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));

    // 알림 제목에 targetCalories와 dailyCalories 사용
    String notificationTitle = "Your Yesterday's Calories";
    String notificationBody = '${dailyData?.calories ?? 0}kcal / ${targetData?.targetCalories ?? 0}kcal';

    await notificationsPlugin.zonedSchedule(
      0, // notification ID
      notificationTitle, // notification title
      notificationBody, // notification body
      _nextInstance(),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_channel_id', // channel ID
          'Daily Channel', // channel name
          channelDescription: 'This is a daily notification channel',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  // scheduled date 설정
  tz.TZDateTime _nextInstance() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, 23, 59, 59);

    print('Scheduled date: $scheduledDate');

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  // noti test
  // Future<void> showTestNotification(String title, String body) async {
  //   const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
  //     'test_channel_id', // channel ID
  //     'Test Channel', // channel name
  //     channelDescription: 'This is a test notification channel',
  //     importance: Importance.max,
  //     priority: Priority.high,
  //   );

  //   const NotificationDetails notificationDetails = NotificationDetails(
  //     android: androidDetails,
  //   );

  //   await notificationsPlugin.show(
  //     0, // notification ID
  //     title, // notification title
  //     body, // notification body
  //     notificationDetails,
  //   );
  // }
}
