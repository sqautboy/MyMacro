import 'package:diet_macro/data/datasources/local/isar_datasource.dart';
import 'package:diet_macro/data/models/isar_data.dart';
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
            requestAlertPermission: true, requestBadgePermission: true, requestSoundPermission: true),
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
    final TargetData? targetData = await IsarDatasource().getTargetData();
    final DailyData? dailyData = await IsarDatasource()
        .getDailyDataByDate(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));

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
  // 11시 59분 59초로 한뒤, 다음날로 넘어갈때 어제의 칼로리 도달량을 알림으로 표시
  tz.TZDateTime _nextInstance() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, 23, 59, 59);

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }
}
