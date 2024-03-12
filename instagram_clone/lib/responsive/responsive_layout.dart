import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:whatsapp_clone/providers/user_provider.dart';

import 'package:whatsapp_clone/utils/global_variables.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget webscreenLayout;
  final Widget mobilescreenLayout;
  const ResponsiveLayout({
    Key? key,
    required this.mobilescreenLayout,
    required this.webscreenLayout,
  }) : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }

  addData() async {
    UserProvider _userprovider = Provider.of(context, listen: false);
    await _userprovider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        //web screen
        return widget.webscreenLayout;
      }
      // mobile screen
      return widget.mobilescreenLayout;
    });
  }
}
