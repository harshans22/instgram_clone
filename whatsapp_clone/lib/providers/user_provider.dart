import 'package:flutter/material.dart';

import 'package:whatsapp_clone/models/user.dart';
import 'package:whatsapp_clone/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
   User? _user;
  final AuthMethods _authMethods = AuthMethods();
  User get getUser => _user!;
  //when user data changes
  Future<void> refreshUser() async {    
      User user = await _authMethods.getUserDetails();
      _user = user;
      notifyListeners();
  }
}
