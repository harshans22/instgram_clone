import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/responsive/mobile_screeen_layout.dart';
import 'package:whatsapp_clone/responsive/responsive_layout.dart';
import 'package:whatsapp_clone/responsive/web_screen_layout.dart';
import 'package:whatsapp_clone/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
            mobileBackgroundColor, //copywith used to set theme for selecte widget
      ),
      home: const ResponsiveLayout(
        mobilescreenLayout: mobilescreenlayout(),
        websceeenLayout: webscreenlayout(),
      ),
    );
  }
}
