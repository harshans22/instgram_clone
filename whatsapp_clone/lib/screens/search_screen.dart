import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:whatsapp_clone/screens/profile_screen.dart";
import "package:whatsapp_clone/utils/colors.dart";
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchcontroller = TextEditingController();
  bool isShowusers = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: TextFormField(
          controller: searchcontroller,
          decoration: const InputDecoration(
            hintText: "Search for a user",
            border: InputBorder.none,
          ),
          onFieldSubmitted: (String _) {
            print(_);
            setState(() {
              isShowusers = true;
            });
          },
        ),
      ),
      body: isShowusers
          ? FutureBuilder(
              //used when want to build widget when data keeps on changing
              future: FirebaseFirestore.instance
                  .collection("users")
                  .where("username",
                      isGreaterThanOrEqualTo: searchcontroller.text)
                  .get(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context)=> 
                            ProfileCsreen(uid: snapshot.data!.docs[index]["uid"]),
                          ));
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                snapshot.data!.docs[index]["photourl"]),
                          ),
                          title: Text(snapshot.data!.docs[index]["username"]),
                        ),
                      );
                    });
              })
          : FutureBuilder(
              future: FirebaseFirestore.instance.collection("Posts").get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return MasonryGridView.count(
                  crossAxisCount: 3,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) => Image.network(
                    snapshot.data!.docs[index]["posturl"],
                    fit: BoxFit.cover,
                  ),
                  mainAxisSpacing: 2.0,
                  crossAxisSpacing: 2.0,
                );
              }),
    );
  }
}
