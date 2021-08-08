import 'package:dio/dio.dart';
import 'package:disc_test/app/data/models/user/user.dart';
import 'package:disc_test/app/data/services/api.dart';
import 'package:disc_test/app/res/config.dart';

class UserRepository {
  late Dio httpClient;

  UserRepository(){
    httpClient = Dio();
  }

  Future<bool> sigup({required User user}) async {
    bool result = false;

    try {
      var response = await httpClient.post(
          AppConfig.userUrl,
          data: {
            "phoneNumber": user.phoneNumber,
            "age": user.age,
            "name": user.name
          });
      result = response.statusCode == 200 || response.statusCode == 201;

    } catch (e) {
      result = false;
      print(e);
    }
    return result;
  }

  Future<User?> login({required String phoneNumber}) async {

    try {
      var response = await httpClient.get(
          AppConfig.userUrl,
          queryParameters: {
            "phoneNumber": phoneNumber
          });
      if(response.statusCode == 200 && response.data != null){
          final user = User.fromJson(response.data[0]);
          return user;
      }

    } catch (e) {
      print(e);
      return null;

    }
    return null;
  }
}