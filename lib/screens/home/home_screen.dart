import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_futter3/configs/themes/app_colors.dart';
import 'package:quiz_app_futter3/configs/themes/ui_parameters.dart';
import 'package:quiz_app_futter3/controllers/question_papers/question_paper_controller.dart';
import 'package:quiz_app_futter3/screens/home/question_card.dart';
import 'package:quiz_app_futter3/widgets/content_area.dart';

import '../../configs/themes/app_icons.dart';
import '../../configs/themes/custom_text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();

    return Scaffold(
      body: Container(
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
                    Icon(AppIcons.menuLeft),
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
  }
}
