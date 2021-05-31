import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class MyApiClient {
  final Dio httpClient;
  late DioCacheManager _dioCacheManager;
  Options _cacheOptions =
      buildCacheOptions(Duration(days: 7), forceRefresh: true);
  MyApiClient({required this.httpClient}) {
    _dioCacheManager = DioCacheManager(CacheConfig());
    this.httpClient.interceptors.add(_dioCacheManager.interceptor);
  }

  fetchAll() async {}
}
