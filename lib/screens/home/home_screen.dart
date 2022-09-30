import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:quiz_app_futter3/configs/themes/app_colors.dart';
import 'package:quiz_app_futter3/configs/themes/ui_parameters.dart';
import 'package:quiz_app_futter3/controllers/question_papers/question_paper_controller.dart';
import 'package:quiz_app_futter3/screens/home/question_card.dart';
import 'package:quiz_app_futter3/widgets/app_circle_button.dart';
import 'package:quiz_app_futter3/widgets/content_area.dart';
import '../../configs/themes/app_icons.dart';
import '../../configs/themes/custom_text_styles.dart';
import '../../controllers/zoom_drawer_controller.dart';
import 'menu_screen.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();

    return Scaffold(
      body: GetBuilder<MyZoomDrawerController>(builder: (_) {
        return ZoomDrawer(
          borderRadius: 50.0,
          showShadow: true,
          moveMenuScreen: false,
          angle: 0.0,
          style: DrawerStyle.defaultStyle,
          menuBackgroundColor: Colors.transparent,
          menuScreenOverlayColor: Colors.transparent,
          slideWidth: MediaQuery.of(context).size.width * 0.8,
          controller: _.zoomDrawerController,
          menuScreen: MyMenuScreen(),
          mainScreen: Container(
            decoration: BoxDecoration(gradient: mainGradient()),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(mobileScreenPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        AppCircleButton(
                          onTap: controller.toggleDrawer,
                          child: Icon(AppIcons.menuLeft),
                        ),

                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Icon(
                                AppIcons.peace,
                              ),
                              Text(
                                "Hello My Son",
                                style: detailText.copyWith(
                                  color: onSurfaceTextColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          "What do you want?",
                          style: headerText,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ContentArea(
                        addPadding: false,
                        child: Obx(() {
                          return ListView.separated(
                            padding: UIParameters.mobileScreenPadding,
                            itemCount: _questionPaperController.allPapers.length,
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(height: 20.0);
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return QuestionCard(
                                model: _questionPaperController.allPapers[index],
                              );
                            },
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
