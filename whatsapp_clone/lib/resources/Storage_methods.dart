import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StoargeMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //adding image to firebase storage
  Future<String> uploadImageToStorage(
      String childName, Uint8List file, bool isPost) async {
    Reference ref =
        _storage.ref().child(childName).child(_auth.currentUser!.uid);

//when we are going toPost 
    if (isPost) {
      String id = const Uuid().v1();
      ref=ref.child(id);// for assiging unique id to posts
    }
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snap = await uploadTask; //  metadata data of uploaded file
    // to download link of our image which is stored in firestore
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
}
