import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/firebase_options.dart';
import 'package:whatsapp_clone/providers/user_provider.dart';
import 'package:whatsapp_clone/responsive/mobile_screeen_layout.dart';
import 'package:whatsapp_clone/responsive/responsive_layout.dart';
import 'package:whatsapp_clone/responsive/web_screen_layout.dart';
import 'package:whatsapp_clone/screens/login_screen.dart';
import 'package:whatsapp_clone/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Capture Craze',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor:
              mobileBackgroundColor, //copywith used to set theme for selected widget
        ),
        // home: const ResponsiveLayout(
        //   mobilescreenLayout: mobilescreenlayout(),
        //   websceeenLayout: webscreenlayout(),
        // // ),
        home: StreamBuilder(
          //   stream:FirebaseAuth.instance.idTokenChanges() ,// use when user restores on a new device
          // stream: FirebaseAuth.instance.userChanges(),// when user want to change data
          stream: FirebaseAuth.instance
              .authStateChanges(), // when user want signin then it searches in previous data
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                 // this function decide which type of screen is there
                return const ResponsiveLayout(
                  mobilescreenLayout: mobilescreenlayout(),
                  webscreenLayout: webscreenlayout(),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('${snapshot.error}'));
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: primaryColor),
              );
            }
    
            return const LoginScreen();// snapshot does not have any data
          },
        ),
      ),
    );
  }
}
