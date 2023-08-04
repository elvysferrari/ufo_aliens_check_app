import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:ufo_aliens_check_app/constants/controllers.dart';

import 'content_image_screen.dart';

class ImageListScreen extends StatefulWidget {
  const ImageListScreen({super.key});

  @override
  State<ImageListScreen> createState() => _ImageListScreenState();
}

class _ImageListScreenState extends State<ImageListScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            //We need swiper for every content
             Swiper(
              itemBuilder: (BuildContext context, int index) {
                return ContentImageScreen(
                  src: contentController.images[index].url,
                  image: contentController.images[index],
                );
              },

              autoplayDelay: 1000,
              itemCount: contentController.images.length,
              scrollDirection: Axis.vertical,
            ),
          ],
        ),
      ),
    );
  }
}
