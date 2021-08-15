import 'package:disc_test/app/data/models/question/question.dart';
import 'package:disc_test/app/data/models/user/user.dart';
import 'package:disc_test/app/data/services/api.dart';
import 'package:disc_test/app/data/services/database_service.dart';

class QuestionRepository {
  final MyApiClient apiClient;
  late FirebaseDatabaseService _databaseService;

  QuestionRepository({required this.apiClient}) {
    _databaseService = FirebaseDatabaseService();
  }

  fetchAllQuestion() async {
    return apiClient.fetchAllQuestion();
  }

  Future<void> updateScore({required MyUser user, required int score}) async {
    await _databaseService.updateScore(user: user, score: score);
  }
}
