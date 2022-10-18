import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:quiz_app_futter3/controllers/auth_controller.dart';
import 'package:quiz_app_futter3/firebase_ref/references.dart';
import 'package:quiz_app_futter3/models/question_paper_model.dart';
import '../../screens/question/question_screen.dart';
import '../../services/firebase_storage_service.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();
      allPapers.assignAll(paperList);

      // for (var paper in paperList) {
      //   final imgUrl =
      //       // await Get.find<FirebaseStorageService>().getImage(paper.title);
      //       await Get.find<FirebaseStorageService>().getImage(paper.imageUrl);
      //   paper.imageUrl = "${imgUrl}";
      //   print("controller image : ${paper.imageUrl}");
      // }
      allPapers.assignAll(paperList);
    } catch (e) {
      print(e);
    }
  }

  void navigateToQuestion({
    required QuestionPaperModel paperModel,
    bool tryAgain = false,
  }) {
    AuthController _authController = Get.find();
    if (_authController.isLoggedIn()) {
      if (tryAgain) {
        Get.back();
        // Get.offNamed();
      } else {
        // Get.toNamed();
        Get.toNamed(QuestionsScreen.routeName, arguments: paperModel);
      }
    } else {
      print('Title is ${paperModel.title}');
      _authController.showLoginAlertDialogue();
    }
  }
}
