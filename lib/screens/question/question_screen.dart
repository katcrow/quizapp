import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_futter3/controllers/question_papers/questions_controller.dart';
import 'package:quiz_app_futter3/widgets/common/background_decoration.dart';
import 'package:quiz_app_futter3/widgets/common/question_place_holder.dart';
import 'package:quiz_app_futter3/widgets/content_area.dart';
import '../../firebase_ref/loading_status.dart';

class QuestionsScreen extends GetView<QuestionsController> {
  const QuestionsScreen({Key? key}) : super(key: key);

  static const String routeName = '/questionsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecoration(
        child: Obx(() {
          return Column(
            children: [
              if (controller.loadingStatus.value == LoadingStatus.loading)
                Expanded(
                  child: ContentArea(child: QuestionScreenHolder()),
                ),
              if (controller.loadingStatus.value == LoadingStatus.completed)
                Expanded(
                  child: ContentArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(controller.currentQuestion.value!.question),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}
