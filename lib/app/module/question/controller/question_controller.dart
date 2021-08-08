import 'package:disc_test/app/data/models/question/question.dart';
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

  final _listQuestion = <Question>[].obs;
  List<Question> get listQuestion => this._listQuestion.value;

  int _score = 0;
  get score => _score;
  void increaseScrore() {
    _score++;
  }

  initData(){
    _score = 0;
    currentPageView = 0;
    getAllQuestion();
  }

  getAllQuestion() {
    questionRepository.fetchAllQuestion().then((data) {
      if (data is List<Question>) {
        _listQuestion.value = data;
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

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
