import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp_clone/models/user.dart'
    as model; // to avoid clash of user of firebase and our User class
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp_clone/resources/Storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// function to get snapshot of data of user details
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection("users").doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

  //signup user
  Future<String> signUpUser({
    required String email, //curly brackets means named paramters
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "some error occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String photourl = await StoargeMethods()
            .uploadImageToStorage("ProfilePics", file, false);

        //add user to our database
        model.User user = model.User(
          email: email,
          uid: cred.user!.uid,
          photourl: photourl,
          username: username,
          bio: bio,
          followers: [],
          following: [],
        );
        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        res = "success";
      }
    } on FirebaseAuthException catch (error) {
      // this is used to show the error which is thrown my firebaseauth
      if (error.code == "email-already-in-use") {
        res = "The email address is already in use by another account.";
      } else if (error.code == "weak-password") {
        res = "Password should be at least 6 characters";
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }

  //Login User
  Future<String> loginuser(
      {required String email, required String password}) async {
    String res = 'some error occured';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res =
            "Please enter all the fields"; //when user does not enter all the fields
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == "invalid-credential") {
        res = "invalid-credential";
      }
    } catch (error) {
      res = error.toString();
    }
    //print(res);
    return res;
  }

  //for sign out
  Future<void> signout() async {
    await _auth.signOut();
  }
}
