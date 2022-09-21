import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quiz_app_futter3/firebase_ref/loading_status.dart';
import 'package:quiz_app_futter3/firebase_ref/references.dart';
import 'package:quiz_app_futter3/models/question_paper_model.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  final loadingStatus = LoadingStatus.loading.obs; // loadingStatus is obs

  Future<void> uploadData() async {
    loadingStatus.value = LoadingStatus.loading; // 0

    final fireStore = FirebaseFirestore.instance; // firebase firestore instance

    final manifestContent =
        await DefaultAssetBundle.of(Get.context!).loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    /**
     * load json file and print path
     */
    final papersInAssets = manifestMap.keys
        .where((path) => path.startsWith("assets/DB/papers") && path.contains(".json"))
        .toList();

    List<QuestionPaperModel> questionPapers = [];
    for (var paper in papersInAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      questionPapers.add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
      // print("========$paper");
      // print(stringPaperContent);
    }
    // print("Items number ${questionPapers[0].description}"); // 4개의 json 파일
    /**
     * firestore 에 넣기 위한 작업
     */
    var batch = fireStore.batch();
    // info : depth-1
    for (var paper in questionPapers) {
      batch.set(questionPaperRF.doc(paper.id), {
        // chk : Map 으로 data insert
        "title": paper.title,
        "image_url": paper.imageUrl,
        "description": paper.description,
        "time_seconds": paper.timeSeconds,
        "questions_count": paper.questions == null ? 0 : paper.questions!.length,
        // "questions_count": paper.questions!.length ?? 0,
      });
      // info : depth-2
      for (var questions in paper.questions!) {
        final questionPath = questionRF(paperId: paper.id, questionId: questions.id);
        batch.set(questionPath, {
          "question": questions.question,
          "correct_answer": questions.correctAnswer,
        });
        // info depth-3
        for (var answer in questions.answers) {
          final answerPath = questionRF(paperId: paper.id, questionId: questions.id);
          batch.set(questionPath.collection("answers").doc(answer.identifier), {
            "identifier": answer.identifier,
            "Answer": answer.answer,
          });
        }
      }
    }

    // chk : DB commit
    await batch.commit();

    loadingStatus.value = LoadingStatus.completed;
  }
}
