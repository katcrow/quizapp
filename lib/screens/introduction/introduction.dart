import 'package:flutter/material.dart';
import 'package:quiz_app_futter3/widgets/app_circle_button.dart';
import 'package:get/get.dart';

import '../../configs/themes/app_colors.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: mainGradient(context),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                size: 65,
              ),
              SizedBox(height: 40.0),
              Text(
                "This is a study app. You can use it as you want. If you understand how it works you would be able to scale it. With this you will master firebase backend and flutter front end.",
                // "2022년 연말을 잘 마무리 하시고, 남은 4분기 교육 및 기타 교육들의 일정을 확인하시고 잘 마무리 하시기 바랍니다. If you understand how it works you would be able to scale it. With this you will master firebase backend and flutter front end.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40.0),
              AppCircleButton(
                onTap: () {
                  return null;
                },
                child: Icon(
                  Icons.arrow_forward,
                  size: 35.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
