import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:disc_test/app/data/models/message_model.dart';
import 'package:disc_test/app/res/config.dart';

class MyApiClient {
  final Dio httpClient;
  late DioCacheManager _dioCacheManager;
  Options _cacheOptions =
      buildCacheOptions(Duration(days: 7), forceRefresh: true);
  MyApiClient({required this.httpClient}) {
    _dioCacheManager = DioCacheManager(CacheConfig());
    this.httpClient.interceptors.add(_dioCacheManager.interceptor);
  }

  fetchAll() async {
    MessageModel? messageModel;
    try {
      var response =
          await httpClient.get(AppConfig.baseUrl, options: _cacheOptions);

      if (response.statusCode == 200 && response.data['message'] != null) {
        print(response.toString());
        messageModel = MessageModel.fromJson(response.data['message']);
      } else
        print('error');
    } catch (e) {
      print(e);
    }

    return messageModel;
  }
}
