
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:spotify_clone/premium/premium.dart';
import 'package:spotify_clone/search/search.dart';
import 'package:spotify_clone/utils/notify.dart';

import 'home/homepage.dart';
import 'library/library.dart';
import 'login/login or signup screen.dart';



// import 'package:awesome_notifications/awesome_notifications.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  AwesomeNotifications().initialize(null, [
    // notification icon
    NotificationChannel(
      channelGroupKey: 'basic_test',
      channelKey: 'basic',
      channelName: 'Basic notifications',
      channelDescription: 'Notification channel for basic tests',
      channelShowBadge: true,
      importance: NotificationImportance.High,
      enableVibration: false,
    ),
  ]);

  runApp( MyApp() );
}

class MyApp extends StatelessWidget {
  Notify notify = Get.put(Notify());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: MyApp(),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginSignupPage(),
        '/home': (context) => HomePage(),
        '/search': (context) => Search(),
        '/library': (context) => LibraryScreen(),
        '/premium': (context) => Premium(),
      },
    );
  }
}
