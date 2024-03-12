import "package:flutter/material.dart";
 
 class webscreenlayout extends StatefulWidget {
  const webscreenlayout({super.key});

  @override
  State<webscreenlayout> createState() => _webscreenlayoutState();
}

class _webscreenlayoutState extends State<webscreenlayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('this is web')),
    );
  }
}