import 'package:disc_test/app/data/models/question.dart';
import 'package:disc_test/app/data/services/api.dart';

class QuestionRepository {
  final MyApiClient apiClient;

  QuestionRepository({required this.apiClient}) : assert(apiClient != null);

  fetchAllQuestion() async {
    return apiClient.fetchAllQuestion();
  }
}
