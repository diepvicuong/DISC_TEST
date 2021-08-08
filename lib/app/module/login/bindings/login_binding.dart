import 'package:disc_test/app/data/repository/user_repository.dart';
import 'package:disc_test/app/module/login/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(
        userRepository:
            UserRepository()));
  }
}
