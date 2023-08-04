import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ufo_aliens_check_app/constants/controllers.dart';
import 'package:ufo_aliens_check_app/models/user_model.dart';

import '../constants/firebase.dart';
import '../models/image_model.dart';
import '../models/video_model.dart';

class AppController extends GetxController{
  static AppController instance = Get.find();

  Rx<String> _deviceUUID = Rx<String>("");
  String get deviceUUID => _deviceUUID.value;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getInfoDevice();
  }

  void getInfoDevice() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? uuid = prefs.getString('device_uuid');
    if(uuid == null){
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      await prefs.setString('device_uuid', androidInfo.id);
      _deviceUUID.value = androidInfo.id;

      await addUserUUID(androidInfo.id);

    }else{
      _deviceUUID.value = uuid;
    }
  }

  Future<void> addUserUUID(String uuid) async {
    UserModel user = UserModel(uuid);
    firebaseFirestore.collection("users").add(user.toJson());
  }

  Future<void> addImageUserLike(String id, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(id, value);

    ImageModel image = await contentController.getImage(id);

    if(value){
      var total = int.parse(image.totalReal) + 1;
      image.totalReal = total.toString();
    }else{
      var total = int.parse(image.totalFake) + 1;
      image.totalFake = total.toString();
    }

    await contentController.updateImage(image);
  }

  Future<void> addVideoUserLike(String id, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(id, value);

    VideoModel video = await contentController.getVideo(id);

    if(value){
      var total = int.parse(video.totalReal) + 1;
      video.totalReal = total.toString();
    }else{
      var total = int.parse(video.totalFake) + 1;
      video.totalFake = total.toString();
    }

    await contentController.updateVideo(video);
  }

  Future<bool> getUserPostLike(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? liked = prefs.getBool(id);

    if(liked != null){
      return true;
    }else{
      return false;
    }
  }
}