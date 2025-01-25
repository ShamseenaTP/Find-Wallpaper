import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_gallery/model/image_model.dart';

class UnsplashController extends GetxController {
  String accessKey = "Hy8RQfsqVLOmzRrJufjLWbi-lQNfz42DcYaVmyYbGGA";
  String secretKey = "";
  
  var isDataLoaded = false.obs;
  var images = <ImageModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    isLoadImages();
  }
  
  void isLoadImages() async{
    String urlToAccessApi = "https://api.unsplash.com/photos/?client_id=" + accessKey;

    var response = await http.get(Uri.parse(urlToAccessApi));
    if(response.statusCode == 200){
      var decodeData = jsonDecode(response.body);

      images.value = List.from(decodeData).map((e) => ImageModel.fromMap(e)).toList();
      isDataLoaded.value = true;

      // print(images[0].urls['raw']);
    }else{
      Get.snackbar("Error", "Error during fetch api data");
    }
  }
}
