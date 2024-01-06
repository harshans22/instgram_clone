import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clone/utils/colors.dart';
import 'package:whatsapp_clone/widgets/post_card.dart';

 class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: SvgPicture.asset("assets/images/ic_instagram.svg",color:primaryColor ,height: 32,),
        actions: [
          IconButton(onPressed: (){}, icon: Image.asset("assets/images/messenger.png",color: primaryColor,height: 25,))
        ],
      ),
      body:const PostCard(),
    );
  }
}