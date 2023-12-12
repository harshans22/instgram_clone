import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:whatsapp_clone/screens/login_screen.dart';
import 'package:whatsapp_clone/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options:const FirebaseOptions(
      apiKey: "AIzaSyDVYllB418P6nvemWd4IaJIvVeC7mbFRw0",
      appId: "1:987521553050:web:a8dae110b7b8b0f024c523",
      messagingSenderId: "987521553050",
      projectId: "instagramclone-e2579",
      storageBucket: "instagramclone-e2579.appspot.com",
    ));
  } else {
   
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Capture Craze',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor:
            mobileBackgroundColor, //copywith used to set theme for selected widget
      ),
      // home: const ResponsiveLayout(
      //   mobilescreenLayout: mobilescreenlayout(),
      //   websceeenLayout: webscreenlayout(),
      // ),
      home: LoginScreen(),
    );
  }
}
