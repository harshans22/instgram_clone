import 'package:flutter/material.dart';
import 'package:whatsapp_clone/utils/colors.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mobileBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          //header section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16)
                .copyWith(right: 0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1682686581660-3693f0c588d2?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHx8"),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "username",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => Dialog(
                                child: ListView(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  shrinkWrap:
                                      true, //makes content of children non-scrollable
                                  children: [
                                    "Delete",
                                  ]
                                      .map(
                                        (e) => InkWell(
                                          onTap: () {},
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 16),
                                            child: Text(e),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ));
                    },
                    icon: const Icon(Icons.more_vert))
              ],
            ),
          ),
          //Image section
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: Image.network(
              "https://images.unsplash.com/photo-1682687220305-ce8a9ab237b1?q=80&w=387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              fit: BoxFit.cover,
            ),
          ),

          //like comment section
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/images/like.png",
                    color: primaryColor,
                    height: 25,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/images/chat.png",
                    color: primaryColor,
                    height: 25,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/images/send.png",
                    color: primaryColor,
                    height: 25,
                  )),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/images/saved.png",
                    color: primaryColor,
                    height: 25,
                  ),
                ),
              )),
            ],
          ),
          //decription and number of commnets
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.w800),
                    child: Text(
                      "123 Likes",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                        top:8
                      ),
                      child: RichText(
                        text: TextSpan(
                          style:const TextStyle(color: primaryColor ),
                          children: [
                            TextSpan(
                          text: "username",
                          style:const TextStyle(fontWeight:FontWeight.bold ),
                            ),
                            TextSpan(
                          text: "description of my comment",
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell( 
                      onTap: (){},
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical:4),
                        child: Text("View all 200 comments",style: TextStyle(
                          fontSize:15,
                          color: secondaryColor, 
                        ),),
                      ),
                    ),
                    Container(
                       
                        child: Text("22/12/2021",style: TextStyle(
                          fontSize:15,
                          color: secondaryColor, 
                        ),),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
