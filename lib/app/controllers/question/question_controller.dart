import 'package:disc_test/app/res/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController {
  final _pageController = PageController(initialPage: 0);
  PageController get pageController => this._pageController;

  final _currentPageView = 0.obs;
  int get currentPageView => this._currentPageView.value;
  set currentPageView(value) => this._currentPageView.value = value;

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
