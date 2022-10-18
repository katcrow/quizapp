import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import '../../configs/themes/app_colors.dart';
import '../../configs/themes/app_icons.dart';
import '../../configs/themes/custom_text_styles.dart';
import '../../controllers/zoom_drawer_controller.dart';
import '../../widgets/app_circle_button.dart';
import '../../widgets/common/background_decoration.dart';
import '../home/menu_screen.dart';

class HealthCheckScreen extends GetView<MyZoomDrawerController> {
  const HealthCheckScreen({Key? key}) : super(key: key);

  static const String routeName = "/health-check";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MyZoomDrawerController>(
        builder: (_) {
          return ZoomDrawer(
            menuScreenWidth: MediaQuery.of(context).size.width,
            borderRadius: 50.0,
            showShadow: false,
            moveMenuScreen: false,
            angle: 0.0,
            style: DrawerStyle.defaultStyle,
            menuBackgroundColor: Colors.transparent,
            menuScreenOverlayColor: Colors.transparent,
            slideWidth: MediaQuery.of(context).size.width * 0.7,
            controller: _.zoomDrawerController,
            menuScreen: MyMenuScreen(),
            mainScreen: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(gradient: mainGradient()),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        left: 20,
                        child: AppCircleButton(
                          onTap: controller.toggleDrawer,
                          child: Icon(AppIcons.menuLeft),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 50, horizontal: 20),
                        child: Row(
                          children: [
                            Icon(
                              AppIcons.peace,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "건강검진과 설문조사의 객관적 추천 데이터",
                              style: detailText.copyWith(
                                color: onSurfaceTextColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 75),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: mainGradient(),
                          ),
                          child: Image.asset(
                            "assets/images/healthcheck.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
