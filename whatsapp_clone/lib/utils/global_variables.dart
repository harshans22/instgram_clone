import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/add_post_screen.dart';
import 'package:whatsapp_clone/screens/feed_screens.dart';
import 'package:whatsapp_clone/screens/profile_screen.dart';
import 'package:whatsapp_clone/screens/search_screen.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
  AddpostScreen(),
  Text("favortite"),
  ProfileCsreen(uid: FirebaseAuth.instance.currentUser!.uid,),
];
