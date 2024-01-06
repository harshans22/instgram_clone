import 'dart:typed_data';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp_clone/models/posts.dart';
import 'package:whatsapp_clone/resources/Storage_methods.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//uplaod post
  Future<String> uplaodPost(String description, Uint8List file, String uid,
      String username, String profImage) async {
    String res = "some error occured";
    try {
      String photourl =
          await StoargeMethods().uploadImageToStorage("Posts", file, true);
      String postId = const Uuid().v1(); // this generated unique id for post
      Post post = Post(
        description: description,
        uid: uid,
        username: username,
        postId: postId,
        datepublished: DateTime.now(),
        posturl: photourl,
        profImage: profImage,
        likes: [],
      );
      _firestore.collection("Posts").doc(postId).set(
            post.toJson(),
          );
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
