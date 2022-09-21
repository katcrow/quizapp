import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_futter3/firebase_ref/loading_status.dart';
import 'controllers/question_papers/data_uploader.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({Key? key}) : super(key: key);

  DataUploader controller = Get.put(DataUploader());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() {
          return Text(controller.loadingStatus.value == LoadingStatus.completed
              ? "upload completed"
              : "Uploading...");
        }),
      ),
    );
  }
}
