import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/services.dart';
import 'pages/splash_screen.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelKey: 'Reminder',
            channelName: 'Reminderr',
            channelDescription: 'Notification channel for basic tests',
            importance: NotificationImportance.High,
            channelShowBadge: true,
            ledColor: Colors.white),
        NotificationChannel(
            channelKey: 'Reminder1',
            channelName: 'Reminderr1',
            channelDescription: 'Notification channel for basic tests',
            importance: NotificationImportance.High,
            channelShowBadge: true,
            ledColor: Colors.white),
        NotificationChannel(
            channelKey: 'Reminder2',
            channelName: 'Reminderr2',
            channelDescription: 'Notification channel for basic tests',
            importance: NotificationImportance.High,
            channelShowBadge: true,
            ledColor: Colors.white),
        NotificationChannel(
            channelKey: 'Reminder3',
            channelName: 'Reminderr3',
            channelDescription: 'Notification channel for basic tests',
            importance: NotificationImportance.High,
            channelShowBadge: true,
            ledColor: Colors.white),
        NotificationChannel(
            channelKey: 'Reminder4',
            channelName: 'Reminderr4',
            channelDescription: 'Notification channel for basic tests',
            importance: NotificationImportance.High,
            channelShowBadge: true,
            ledColor: Colors.white),
        NotificationChannel(
            channelKey: 'Reminder5',
            channelName: 'Reminderr5',
            channelDescription: 'Notification channel for basic tests',
            importance: NotificationImportance.High,
            channelShowBadge: true,
            ledColor: Colors.white),
        NotificationChannel(
            channelKey: 'Reminder6',
            channelName: 'Reminderr6',
            channelDescription: 'Notification channel for basic tests',
            importance: NotificationImportance.High,
            channelShowBadge: true,
            ledColor: Colors.white),
        NotificationChannel(
            channelKey: 'Reminder7',
            channelName: 'Reminderr7',
            channelDescription: 'Notification channel for basic tests',
            importance: NotificationImportance.High,
            channelShowBadge: true,
            ledColor: Colors.white),
        NotificationChannel(
            channelKey: 'Reminder8',
            channelName: 'Reminderr8',
            channelDescription: 'Notification channel for basic tests',
            importance: NotificationImportance.High,
            channelShowBadge: true,
            ledColor: Colors.white),
        NotificationChannel(
            channelKey: 'Reminder9',
            channelName: 'Reminderr9',
            channelDescription: 'Notification channel for basic tests',
            importance: NotificationImportance.High,
            channelShowBadge: true,
            ledColor: Colors.white),
      ],
      debug: true);
  
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(LoginUiApp()));
}

class LoginUiApp extends StatelessWidget {
  Color _primaryColor = Color.fromARGB(255, 181, 217, 240);
  Color _accentColor = Color.fromARGB(255, 159, 198, 223);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hemoglobin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
      home: SplashScreen(title: 'Hemoglobin'),
    );
  }
}
