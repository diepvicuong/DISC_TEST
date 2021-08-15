import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disc_test/app/data/models/user/user.dart';
import 'package:disc_test/app/data/repository/user_repository.dart';
import 'package:disc_test/app/res/constant.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final UserRepository userRepository;

  LoginController({required this.userRepository});

  MyUser? _currentUser;
  MyUser? get currentUser => _currentUser;

  Timer? _countDownTimer;

  RxInt _countDownOtp = AppConstant.timeoutOtp.obs;
  int get countDownOtp => _countDownOtp.value;

  /// Using Rest Api Function
  // Future<bool> signupViaRestApi(
  //     {required String phoneNumber, int? age, String? name}) async {
  //   final newUser = MyUser(phoneNumber: phoneNumber, age: age, name: name);
  //   final result = await userRepository.sigupViaRestApi(user: newUser);
  //   if (result == true) {
  //     _currentUser = newUser;
  //   }
  //   return result;
  // }

  // Future<bool> loginViaRestApi({required String phoneNumber}) async {
  //   final formatPhonenumber = "+84" + phoneNumber.substring(1);
  //   final user =
  //       await userRepository.loginViaRestApi(phoneNumber: formatPhonenumber);
  //   if (user != null) {
  //     _currentUser = user;
  //     return true;
  //   }

  //   return false;
  // }

  /// Using Firebase function
  Future<void> sendOtp({required String phoneNumber}) async {
    _startTimer();
    await userRepository.sendOtp(phoneNumber: phoneNumber);
  }

  Future<bool> signupViaFirebase({required String smsOtp}) async {
    final firebaseUser = await userRepository.signUpViaFirebase(smsOtp: smsOtp);
    if (firebaseUser != null) {
      _currentUser = MyUser(
          id: firebaseUser.uid, phoneNumber: firebaseUser.phoneNumber ?? '');

      return true;
    }

    return false;
  }

  Future<bool> loginViaFirebase(
      {required String phoneNumber, required String password}) async {
    final user = await userRepository.loginViaFirebase(
        phoneNumber: phoneNumber, password: password);
    if (user != null) {
      _currentUser = user;
      return true;
    }
    return false;
  }

  Future<bool> isExist({required String phoneNumber}) async {
    return await userRepository.isExist(phoneNumber: phoneNumber);
  }

  /// Register function
  Future<bool> registerUser({int? age, String? name, String? password}) async {
    bool result = false;
    if (_currentUser != null) {
      _currentUser!.age = age;
      _currentUser!.name = name;
      _currentUser!.password = password;
      result = await userRepository.registerUser(_currentUser!);
    }

    return result;
  }

  /// Handle Timer
  void _startTimer() {
    const oneSec = const Duration(seconds: 1);
    if (_countDownTimer != null) {
      _countDownTimer?.cancel();
      _countDownTimer = null;
    }
    _countDownTimer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_countDownOtp.value == 0) {
          _countDownOtp.value = AppConstant.timeoutOtp;
          timer.cancel();
        } else {
          _countDownOtp.value--;
        }
      },
    );
  }

  @override
  void dispose() {
    if (_countDownTimer != null) {
      _countDownTimer?.cancel();
      _countDownTimer = null;
    }
    super.dispose();
  }
}
