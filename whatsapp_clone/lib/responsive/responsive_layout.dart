import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp_clone/utils/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget websceeenLayout;
  final Widget mobilescreenLayout;
  const ResponsiveLayout(
      {Key? key,
       required this.mobilescreenLayout,
      required this.websceeenLayout,
     })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        //web screen
        return websceeenLayout;
      }
      // mobile screen
      return mobilescreenLayout; 
    });
  }
}
