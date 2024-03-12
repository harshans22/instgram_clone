import 'package:flutter/material.dart';

class FollowButton extends StatelessWidget {
  final Function()? function;
  final Color backgroundcolor;
  final Color BorderColor;
  final String text;
  final Color textcolor;
  const FollowButton({
    super.key,
    this.function,
    required this.backgroundcolor,
    required this.BorderColor,
    required this.text,
    required this.textcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 2),
      child: TextButton(
        onPressed: function,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundcolor,
            border: Border.all(color: BorderColor),
            borderRadius: BorderRadius.circular(5),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(color: textcolor, fontWeight: FontWeight.bold),
          ),
          width: 220,
          height: 25,
        ),
      ),
    );
  }
}
