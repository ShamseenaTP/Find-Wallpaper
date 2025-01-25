import 'package:flutter/material.dart';
import 'package:wallpaper_gallery/model/image_model.dart';

class WallpaperImage extends StatelessWidget {
  const WallpaperImage({
    super.key,
    required this.currentImage, required this.onTap,
  });

  final ImageModel currentImage;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Card(
        elevation: 3, 
        child: Image.network(
          currentImage.urls['small'],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}