import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:disc_test/app/data/models/question/question.dart';
import 'package:disc_test/app/res/config.dart';

class MyApiClient {
  final Dio httpClient;
  // late DioCacheManager _dioCacheManager;
  // Options _cacheOptions =
  //     buildCacheOptions(Duration(days: 7), forceRefresh: true);
  MyApiClient({required this.httpClient}) {
    // _dioCacheManager = DioCacheManager(CacheConfig());
    // this.httpClient.interceptors.add(_dioCacheManager.interceptor);
  }

  fetchAllQuestion() async {
    List<Question>? questionList;
    try {
      var response = await httpClient.get(AppConfig.questionUrl);

      print(response);
      if (response.statusCode == 200 && response.data != null) {
        print(response.toString());
        questionList = List<Question>.from(response.data
            .map((jsonQuestion) => Question.fromJson(jsonQuestion)));
      } else
        print('error');
    } catch (e) {
      print(e);
    }

    return questionList;
  }
}
