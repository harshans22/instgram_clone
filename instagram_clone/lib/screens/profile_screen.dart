import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/resources/auth_methods.dart';
import 'package:whatsapp_clone/resources/firestore_methods.dart';
import 'package:whatsapp_clone/screens/login_screen.dart';
import 'package:whatsapp_clone/utils/colors.dart';
import 'package:whatsapp_clone/utils/utils.dart';
import 'package:whatsapp_clone/widgets/follow_unfollow_button.dart';

class ProfileCsreen extends StatefulWidget {
  final String uid;
  const ProfileCsreen({super.key, required this.uid});

  @override
  State<ProfileCsreen> createState() => _ProfileCsreenState();
}

class _ProfileCsreenState extends State<ProfileCsreen> {
  var userData = {};
  int postlength = 0;
  int followers = 0;
  int following = 0;
  bool isfollowing = false;
  bool isloading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isloading = true;
    });
    try {
      var usersnap = await FirebaseFirestore.instance
          .collection("users")
          .doc(widget.uid)
          .get();

      //get post Length
      var postsnap = await FirebaseFirestore.instance
          .collection("Posts")
          .where("uid", isEqualTo: widget.uid)
          .get();

     postlength = postsnap.docs.length;
      userData = usersnap.data()!;
      followers = usersnap.data()!["followers"].length;
      following = usersnap.data()!["following"].length;
      isfollowing = usersnap
          .data()!["followers"]
          .contains(FirebaseAuth.instance.currentUser!.uid);
      setState(() {});
      print("success");
    } catch (e) {
      showSnackBar(e.toString(), context);
      print("failed");
    }
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isloading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: mobileBackgroundColor,
              title: Text(userData["username"]),
            ),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            backgroundImage: NetworkImage(userData["photourl"]),
                            radius: 40,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    buildStateColumn(postlength, "Posts"),
                                    buildStateColumn(followers, "Followers"),
                                    buildStateColumn(following, "Following"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FirebaseAuth.instance.currentUser!.uid ==
                                            widget.uid
                                        ? FollowButton(
                                            backgroundcolor:
                                                mobileBackgroundColor,
                                            BorderColor: Colors.grey,
                                            text: "Sign out",
                                            textcolor: primaryColor,
                                            function: () async {
                                              await AuthMethods().signout();
                                              if (context.mounted) {
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                LoginScreen()));
                                              }
                                            },
                                          )
                                        : isfollowing
                                            ? FollowButton(
                                                backgroundcolor: Colors.white,
                                                BorderColor: Colors.grey,
                                                text: "Unfollow",
                                                textcolor: Colors.black,
                                                function: () async {
                                                  await FirestoreMethods()
                                                      .followuser(
                                                          FirebaseAuth.instance
                                                              .currentUser!.uid,
                                                          userData["uid"]);
                                                  setState(() {
                                                    isfollowing = false;
                                                    followers--;
                                                  });
                                                },
                                              )
                                            : FollowButton(
                                                backgroundcolor: Colors.blue,
                                                BorderColor: Colors.blue,
                                                text: "Follow",
                                                textcolor: Colors.white,
                                                function: () async {
                                                  await FirestoreMethods()
                                                      .followuser(
                                                          FirebaseAuth.instance
                                                              .currentUser!.uid,
                                                          userData["uid"]);
                                                  setState(() {
                                                    isfollowing = true;
                                                    followers++;
                                                  });
                                                },
                                              ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          userData['username'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(top: 1),
                        child: Text(
                          userData['bio'],
                          style: TextStyle(),
                        ),
                      ),
                      const Divider(),
                      FutureBuilder(
                          future: FirebaseFirestore.instance
                              .collection("Posts")
                              .where("uid", isEqualTo: widget.uid)
                              .get(),
                          builder: (context,
                              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                  snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return GridView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data!.docs.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 2,
                                        mainAxisSpacing: 2,
                                        childAspectRatio: 1),
                                itemBuilder: (context, index) {
                                  DocumentSnapshot snap =
                                      snapshot.data!.docs[index];
                                  return Container(
                                    child: Image(
                                      image: NetworkImage(
                                        snap["posturl"],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                });
                          })
                    ],
                  ),
                )
              ],
            ),
          );
  }

  Column buildStateColumn(int num, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          num.toString(),
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Container(
            margin: EdgeInsets.only(top: 4),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            )),
      ],
    );
  }
}
