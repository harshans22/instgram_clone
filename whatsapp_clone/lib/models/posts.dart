import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String username;
  final String postId;
  final  datepublished;
  final String posturl;
  final String profImage;
  final likes;

  Post({
    required this.description,
    required this.uid,
    required this.username,
    required this.postId,
    required this.datepublished,
    required this.posturl,
    required this.profImage,
    required this.likes,
  });

  Map<String, dynamic> toJson() => {
        "description": description,
        "uid": uid,
        "username": username,
        "postId": postId,
        "datepublished": datepublished,
        "posturl": posturl,
        "profImage": profImage,
        "likes":likes,

      };

  // function to create document snapshot and return usermodel
  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Post(
      description: snapshot["description"],
      uid: snapshot["uid"],
      username: snapshot["username"],
      postId: snapshot["postId"],
      datepublished: snapshot["datepublished"],
      posturl: snapshot["posturl"],
      profImage: snapshot["profImage"],
      likes: snapshot["likes"],
    );
  }
}
