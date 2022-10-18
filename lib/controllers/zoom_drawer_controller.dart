import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:quiz_app_futter3/controllers/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();

  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();

    super.onReady();
  }

  // zoom 값을 변경하는 토글 (있다, 없다)
  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update(); // setState or notifier 역할
  }

  void signOut(){
    Get.find<AuthController>().signOut();
  }

  void signIn(){

  }

  void website(){
    _launch("https://www.ecaren.co.kr");
  }

  void facebook(){
    _launch("https://www.facebook.com");
  }

  void email(){
    final Uri emailLaunchUri =  Uri(
      scheme: 'mailto',
      path: 'katcrow@naver.com'
    );
    _launch(emailLaunchUri.toString());
  }

  Future<void> _launch(String url) async {
    if(!await launch(url)){
      throw 'could not launch $url';
    }
  }


}
