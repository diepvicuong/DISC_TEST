import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:disc_test/app/data/models/question/question.dart';
import 'package:disc_test/app/data/models/user/user.dart';
import 'package:disc_test/app/data/repository/question_repository.dart';
import 'package:disc_test/app/data/services/audio_service.dart';
import 'package:disc_test/app/data/services/manger_service.dart';
import 'package:disc_test/app/module/login/controller/login_controller.dart';
import 'package:disc_test/app/res/config.dart';
import 'package:disc_test/app/res/constant.dart';
import 'package:disc_test/app/routes/app_pages.dart';
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
    scoreList[currentPageView] = true;
  }

  var scoreList = List.generate(10, (index) => false);

  Timer? _countDownTimer;
  RxInt _countDownQuestion =
      ManagerService.instance.configuration.questionTimer.obs; // in seconds
  int get countDownQuestionSec => _countDownQuestion.value;
  String get countDownQuestionInStr {
    final duration = Duration(seconds: _countDownQuestion.value);

    return duration.toString().split('.')[0];
  }

  /// Related data function
  initData() async {
    _score = 0;
    currentPageView = 0;
    await getAllQuestion();
    _startTimer();
    scoreList = List.generate(listQuestion.length, (index) => false);
    print("Scorelist" + scoreList.toString());
  }

  getAllQuestion() async {
    await questionRepository.fetchAllQuestion().then((data) {
      if (data is List<Question>) {
        _listQuestion.value = data..shuffle();
      }
    });
  }

  /// Releated pageview function
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

  Future<void> finish() async {
    Get.toNamed(Routes.RESULT_PAGE);

    final MyUser? user = Get.find<LoginController>().currentUser;
    if (user != null) {
      await questionRepository.updateScore(user: user, score: score);
    }
    stopTimer();
    AudioService.stopAudio();
  }

  /// Handle Timer
  void _startTimer() {
    _countDownQuestion.value =
        ManagerService.instance.configuration.questionTimer;
    const tenMiliSec = const Duration(seconds: 1);
    stopTimer();
    _countDownTimer = new Timer.periodic(
      tenMiliSec,
      (Timer timer) {
        if (_countDownQuestion.value == 0) {
          finish();
          timer.cancel();
        } else {
          _countDownQuestion.value--;
          if (_countDownQuestion.value == 10) {
            AudioService.playAudio();
          }
        }
      },
    );
  }

  void stopTimer() {
    if (_countDownTimer != null) {
      _countDownTimer?.cancel();
      _countDownTimer = null;
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    stopTimer();
    super.dispose();
  }
}
