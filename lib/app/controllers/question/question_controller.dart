import 'package:disc_test/app/data/models/data_model.dart';
import 'package:disc_test/app/data/models/message_model.dart';
import 'package:disc_test/app/data/repository/question_repository.dart';
import 'package:disc_test/app/res/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController {
  final QuestionRepository questionRepository;
  QuestionController({required this.questionRepository});

  final _pageController = PageController(initialPage: 0);

  PageController get pageController => this._pageController;

  final _currentPageView = 0.obs;
  int get currentPageView => this._currentPageView.value;
  set currentPageView(value) => this._currentPageView.value = value;

  final _listQuestion = <QuestionData>[].obs;
  List<QuestionData> get listQuestion => this._listQuestion.value;
  set listQuestion(value) => this._listQuestion.value = value;

  getAllQuestion() {
    questionRepository.getAll().then((data) {
      if (data is MessageModel) {
        listQuestion = data.data;
      }
    });
  }

  nextPage() {
    pageController.nextPage(
        duration: Duration(milliseconds: AppConfig.pageChangeMilisecond),
        curve: Curves.easeIn);
  }

  previousPage() {
    pageController.previousPage(
        duration: Duration(milliseconds: AppConfig.pageChangeMilisecond),
        curve: Curves.easeOut);
  }

  finish() {}
}
