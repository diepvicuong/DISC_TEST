import 'package:disc_test/app/data/models/user/user.dart';
import 'package:disc_test/app/data/repository/user_repository.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginController extends GetxController{
  final UserRepository userRepository;

  LoginController({required this.userRepository});

  User? _currentUser;
  User? get currentUser => _currentUser;

  Future<bool> signup({required String phoneNumber, int? age, String? name}) async{
    final newUser = User(phoneNumber: phoneNumber, age: age, name: name);
    final result = await userRepository.sigup(user: newUser);
    if(result == true){
      _currentUser = newUser;
    }

    return result;
  }

  Future<bool> login({required String phoneNumber}) async{
    final user = await userRepository.login(phoneNumber: phoneNumber);
    if(user!= null){
      _currentUser = user;
      return true;
    }

    return false;
  }
}