import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_gallery/controller/unsplash_controller.dart';
import 'package:wallpaper_gallery/screen/image_details.dart';
import 'package:wallpaper_gallery/screen/wallpaper_image.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  final UnsplashController _unsplashController = Get.put(UnsplashController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "WALLPAPERS",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: size.height,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Obx(
          () => _unsplashController.isDataLoaded.value == true
              ? GridView.builder(
                  itemCount: _unsplashController.images.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    var currentImage = _unsplashController.images[index];
                    return WallpaperImage(
                      currentImage: currentImage,
                      onTap: () {
                        Get.to(() => ImageDetails(imageModel: currentImage));
                      },
                    );
                  })
              : const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
