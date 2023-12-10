import "package:flutter/material.dart";

class mobilescreenlayout extends StatefulWidget {
  const mobilescreenlayout({super.key});

  @override
  State<mobilescreenlayout> createState() => _mobilescreenlayoutState();
}

class _mobilescreenlayoutState extends State<mobilescreenlayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('this is mobile')),
    );
  }
}