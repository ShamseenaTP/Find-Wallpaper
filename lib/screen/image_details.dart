import 'package:flutter/material.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:wallpaper_gallery/model/image_model.dart';

class ImageDetails extends StatelessWidget {
  const ImageDetails({super.key, required this.image});

  final ImageModel image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        child: Image.network(
          image.urls['small'],
          fit: BoxFit.cover,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async{
          // int location = WallpaperManager.BOTH_SCREEN; 
          // String imageUrl = image.urls['small'];
          // var file = await DefaultCacheManager().getSingleFile(imageUrl);
          // await WallpaperManager.setWallpaperFromFile(file.path, location); 
        },
        label: const Icon(Icons.wallpaper),
      ),
    );
  }
}
