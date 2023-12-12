import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clone/utils/colors.dart';
import 'package:whatsapp_clone/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Container(),
              flex: 1,
            ),
            //svg image
            SvgPicture.asset(
              "assets/images/Capture Craze logo.svg",
            ),
            TextFieldInput(
              hintText: 'Enter your email',
              textInputType: TextInputType.emailAddress,
              textEditingController: _emailController,
            ),
            SizedBox(
              height: 24,
            ),
            TextFieldInput(
              hintText: 'Enter your password',
              textInputType: TextInputType.emailAddress,
              textEditingController: _passController,
              isPass: true,
            ),
             SizedBox(
              height: 24,
            ),
            Container(
              child: const Text('Log in'),
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const ShapeDecoration(shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              color: Colors.blue,
              )
            ),
             SizedBox(
              height: 12,
            ),
            Flexible(
              child: Container(),
              flex: 1,
            ),
            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child:const Text("Don't have an account?",style: TextStyle(fontWeight: FontWeight.w400),),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
                Container(
                  child:const Text("Sign up",style: TextStyle(fontWeight:FontWeight.bold ),),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
