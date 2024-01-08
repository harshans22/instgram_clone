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

  //like post
  Future<void> likepost(
    String postId,
    String uid,
    List likes,
  ) async {
    try {
      if (likes.contains(uid)) {
        //when we have already liked the post
        _firestore.collection("Posts").doc(postId).update({
          "likes": FieldValue.arrayRemove(
              [uid]), //removing the uid which has already liked the post
        });
      } else {
        //for uid which has not liked the post
        _firestore.collection("Posts").doc(postId).update({
          "likes": FieldValue.arrayUnion(
              [uid]), //adding the uid which has not liked the post
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //function for comments
  Future<void> postComment(String postId, String text, String uid, String name,
      String profilepic) async {
    try {
      if (text.isNotEmpty) {
        String commentId = const Uuid().v1();
        //creating collections of each comment based on unique commentid
        await _firestore
            .collection("Posts")
            .doc(postId)
            .collection("comments")
            .doc(commentId)
            .set({
          "profilePic": profilepic,
          "name": name,
          "uid": uid,
          "text": text,
          'commentId': commentId,
          'datePublished': DateTime.now(),
        });
        print("success");
      } else {
        print("text is empty");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //deleting a post
  Future<void> deletePost(String postId) async {
    try {
      await _firestore.collection("Posts").doc(postId).delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
