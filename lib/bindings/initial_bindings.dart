import 'package:get/get.dart';
import 'package:quiz_app_futter3/controllers/auth_controller.dart';
import 'package:quiz_app_futter3/controllers/theme_controller.dart';

class InitialBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
  }

}