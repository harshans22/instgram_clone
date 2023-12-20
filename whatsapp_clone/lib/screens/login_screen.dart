import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            Flexible(flex: 1,
              child: Container(),
              
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
           const SizedBox(
              height: 24,
            ),
            TextFieldInput(
              hintText: 'Enter your password',
              textInputType: TextInputType.emailAddress,
              textEditingController: _passController,
              isPass: true,
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: (){},
              child: Container(
                
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                color: Colors.blue,
                ),
                child: const Text('Log in'),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Flexible(flex: 1,
              child: Container(),
              
            ),
            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                   padding: const EdgeInsets.symmetric(vertical: 8),
                  child:const Text("Don't have an account?",style: TextStyle(fontWeight: FontWeight.w400),),
                 
                ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child:const Text("Sign up",style: TextStyle(fontWeight:FontWeight.bold ),),
                    
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
