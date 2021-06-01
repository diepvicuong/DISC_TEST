import 'package:disc_test/app/data/providers/api.dart';

class QuestionRepository {
  final MyApiClient apiClient;

  QuestionRepository({required this.apiClient}) : assert(apiClient != null);

  getAll() {
    return apiClient.fetchAll();
  }
}
