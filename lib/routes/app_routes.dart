import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:quiz_app_futter3/controllers/question_papers/question_paper_controller.dart';
import 'package:quiz_app_futter3/models/question_paper_model.dart';
import 'package:quiz_app_futter3/screens/health_check/health_check_screen.dart';
import 'package:quiz_app_futter3/screens/home/home_screen.dart';
import 'package:quiz_app_futter3/screens/introduction/introduction.dart';
import 'package:quiz_app_futter3/screens/login/login_screen.dart';
import 'package:quiz_app_futter3/screens/question/question_screen.dart';
import 'package:quiz_app_futter3/screens/survey/health_survey.dart';
import '../controllers/question_papers/questions_controller.dart';
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
          children: [
            GetPage(
            name: "/home/survey",
            page: () => HealthSurvey(),)
          ],
          binding: BindingsBuilder(() {
            Get.put(QuestionPaperController());
            Get.put(MyZoomDrawerController());
          }),
        ),
        GetPage(
          name: "/survey",
          page: () => HealthSurvey(),
          binding: BindingsBuilder(() {
            // Get.put(QuestionPaperController());
            Get.put(MyZoomDrawerController());
          }),
        ),

        GetPage(
          name: LoginScreen.routeName,
          page: () => LoginScreen(),
        ),

    GetPage(
      name: HealthCheckScreen.routeName,
      page: () => HealthCheckScreen(),
    ),
        GetPage(
            name: QuestionsScreen.routeName,
            page: () => QuestionsScreen(),
            binding: BindingsBuilder<QuestionPaperModel>(() {
              Get.put(QuestionsController());
            })),
      ];
}
