import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:quiz_app_futter3/controllers/question_papers/question_paper_controller.dart';
import 'package:quiz_app_futter3/screens/home/home_screen.dart';
import 'package:quiz_app_futter3/screens/introduction/introduction.dart';
import '../controllers/zoom_drawer_controller.dart';
import '../screens/splash/splash_screen.dart';


class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(
          name: "/",
          page: () => SplashScreen(),
        ),
        GetPage(
          name: "/introduction",
          page: () => AppIntroductionScreen(),
        ),
        GetPage(
          name: "/home",
          page: () => HomeScreen(),
          binding: BindingsBuilder(() {
            Get.put(QuestionPaperController());
            Get.put(MyZoomDrawerController());
          })
        ),
      ];
}
