import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  // zoom 값을 변경하는 토글 (있다, 없다)
  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update(); // setState or notifier 역할
  }
}
