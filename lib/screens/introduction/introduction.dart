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
          gradient: mainGradient(),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.healing,
                size: 65,
              ),
              SizedBox(height: 40.0),
              Text(
                "국민의 건강관리 및 국가 의료정책의 패러다임이 질병치료에서 질병예방의 개념으로 전환되면서 건강을 유지/개선할 수 있는 건강기능식품의 필요성에 대한 인식과 사회적 욕구가 증가하고 있습니다.",
                // "2022년 연말을 잘 마무리 하시고, 남은 4분기 교육 및 기타 교육들의 일정을 확인하시고 잘 마무리 하시기 바랍니다. If you understand how it works you would be able to scale it. With this you will master firebase backend and flutter front end.",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,height: 1.7
                ),
              ),
              SizedBox(height: 40.0),
              AppCircleButton(
                onTap: () => Get.offAndToNamed("/home"),
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
