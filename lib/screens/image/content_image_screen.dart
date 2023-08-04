import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:ufo_aliens_check_app/models/image_model.dart';
import 'package:ufo_aliens_check_app/screens/video/option_image_screen.dart';
import 'package:video_player/video_player.dart';
import '../../widgets/like_icon.dart';
import '../video/option_video_screen.dart';


class ContentImageScreen extends StatefulWidget {
  final String? src;
  final ImageModel image;
  const ContentImageScreen({required this.image, Key? key, this.src}) : super(key: key);

  @override
  _ContentImageScreenState createState() => _ContentImageScreenState();
}

class _ContentImageScreenState extends State<ContentImageScreen> {

  bool _liked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        InteractiveViewer(
            maxScale: 10.0,
            child: CachedNetworkImage(
              imageUrl: widget.src ?? "",
              ),
            //Image.network(widget.src ?? "")
        ),
        if (_liked)
          const Center(
            child: LikeIcon(),
          ),
        OptionsImageScreen(image: widget.image),
      ],
    );
  }
}