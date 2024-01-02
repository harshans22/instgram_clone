
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:whatsapp_clone/providers/user_provider.dart";
import 'package:whatsapp_clone/models/user.dart'
    as model;

class mobilescreenlayout extends StatefulWidget {
  const mobilescreenlayout({super.key});

  @override
  State<mobilescreenlayout> createState() => _mobilescreenlayoutState();
}

class _mobilescreenlayoutState extends State<mobilescreenlayout> {
  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: Center(child: Text("harsh")),
    );
  }
}
