import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_futter3/bindings/initial_bindings.dart';
import 'package:quiz_app_futter3/configs/themes/app_dark_theme.dart';
import 'package:quiz_app_futter3/configs/themes/app_light_theme.dart';
import 'package:quiz_app_futter3/data_uploader_screen.dart';
import 'package:quiz_app_futter3/firebase_options.dart';
import 'package:quiz_app_futter3/routes/app_routes.dart';
import 'package:quiz_app_futter3/screens/introduction/introduction.dart';
import 'package:quiz_app_futter3/screens/splash/splash_screen.dart';

import 'controllers/theme_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //-- info : firebase 초기화
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  InitialBindings().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Get.find<ThemeController>().lightTheme,
      // theme: DarkTheme().buildDarkTheme(),
      getPages: AppRoutes.routes(),
    );
  }
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(GetMaterialApp(
//     home: DataUploaderScreen(),
//   ));
// }
