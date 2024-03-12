import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  final String uid;
  final String email;
  final String bio;
  final List followers;
  final List following;
  final String photourl;

  User(
      {required this.email,
      required this.uid,
      required this.photourl,
      required this.username,
      required this.bio,
      required this.followers,
      required this.following});

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "photourl": photourl,
        "bio": bio,
        "followers": followers,
        "following": following,
      };

  // function to create document snapshot and return usermodel
  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      username: snapshot["username"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      photourl: snapshot["photourl"],
      bio: snapshot["bio"],
      followers: snapshot['followers'],
      following: snapshot['following'],
    );
  }
}
