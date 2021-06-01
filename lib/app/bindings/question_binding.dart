import 'package:dio/dio.dart';
import 'package:disc_test/app/controllers/question/question_controller.dart';
import 'package:disc_test/app/data/providers/api.dart';
import 'package:disc_test/app/data/repository/question_repository.dart';
import 'package:get/get.dart';

class QuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionController>(() => QuestionController(
        questionRepository:
            QuestionRepository(apiClient: MyApiClient(httpClient: Dio()))));
  }
}
