import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ufo_aliens_check_app/constants/pallet_colors.dart';
import '../../constants/controllers.dart';
import 'content_video_screen.dart';

class VideoListScreen extends StatelessWidget {
  VideoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Obx(
        () => Stack(
          children: [
            //We need swiper for every content
            Swiper(
              itemBuilder: (BuildContext context, int index) {
                return ContentVideoScreen(
                  src: contentController.videos[index].url, video: contentController.videos[index],
                );
              },
              autoplayDelay: 1000,
              itemCount: contentController.videos.length,
              scrollDirection: Axis.vertical,
            ),
          ],
        ),
      )),
    );
  }
}
