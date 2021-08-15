import 'package:dio/dio.dart';
import 'package:disc_test/app/data/models/user/user.dart';
import 'package:disc_test/app/data/services/api.dart';
import 'package:disc_test/app/data/services/authentication_service.dart';
import 'package:disc_test/app/data/services/database_service.dart';
import 'package:disc_test/app/res/config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserRepository {
  late Dio httpClient;
  late FirebaseAuthService _authService;
  late FirebaseDatabaseService _databaseService;
  UserRepository() {
    httpClient = Dio();
    _authService = FirebaseAuthService();
    _databaseService = FirebaseDatabaseService();
  }

  Future<bool> sigupViaRestApi({required MyUser user}) async {
    bool result = false;

    try {
      var response =
          await httpClient.post(AppConfig.userUrl, data: user.toJson());
      result = response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      result = false;
      print(e);
    }
    return result;
  }

  Future<MyUser?> loginViaRestApi({required String phoneNumber}) async {
    try {
      var response = await httpClient.get(AppConfig.userUrl,
          queryParameters: {"phoneNumber": phoneNumber});
      if (response.statusCode == 200 && response.data != null) {
        final user = MyUser.fromJson(response.data[0]);
        return user;
      }
    } catch (e) {
      print(e);
      return null;
    }
    return null;
  }

  Future<void> sendOtp({required String phoneNumber}) async {
    try {
      if (kIsWeb) {
        await _authService.verifyWebPhoneNumber(phoneNumber: phoneNumber);
      } else {
        await _authService.verifyPhoneNumber(phoneNumber: phoneNumber);
      }
    } catch (error) {
      print(error);
    }
  }

  Future<User?> signUpViaFirebase({required String smsOtp}) async {
    try {
      if (kIsWeb) {
        return await _authService.confirmCodeWeb(smsOtp: smsOtp);
      } else {
        return await _authService.signInWithPhoneNumber(smsOtp: smsOtp);
      }
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<bool> registerUser(MyUser user) async {
    return await _databaseService.registerUser(user);
  }

  Future<MyUser?> loginViaFirebase(
      {required String phoneNumber, required String password}) async {
    return await _databaseService.isExistUser(
        phoneNumber: phoneNumber, password: password);
  }

  Future<bool> isExist({required String phoneNumber}) async {
    return await _databaseService.checkPhoneNumberIsExist(
        phoneNumber: phoneNumber);
  }
}
