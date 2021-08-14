import 'package:disc_test/app/module/finish/page/finish_page.dart';
import 'package:disc_test/app/module/finish/page/result_page.dart';
import 'package:disc_test/app/module/login/bindings/login_binding.dart';
import 'package:disc_test/app/module/login/page/register_page.dart';
import 'package:disc_test/app/module/login/page/login_page.dart';
import 'package:disc_test/app/module/login/page/sigup_page.dart';
import 'package:disc_test/app/module/login/page/start_page.dart';
import 'package:disc_test/app/module/question/binding/question_binding.dart';
import 'package:disc_test/app/module/question/page/question_page.dart';
import 'package:disc_test/app/module/welcome/page/help_page.dart';
import 'package:disc_test/app/module/welcome/page/welcome_page.dart';
import 'package:get/get.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => WelcomePage(),
    ),
    GetPage(
      name: Routes.HELP_PAGE,
      page: () => HelpPage(),
    ),
    GetPage(
      name: Routes.LOGIN_PAGE,
      page: () => LoginPage(),
      // binding: LoginBinding()
    ),
    GetPage(
      name: Routes.REGISTER_PAGE,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: Routes.SIGNUP_PAGE,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: Routes.START_PAGE,
      page: () => StartPage(),
    ),
    GetPage(
      name: Routes.QUESTION_PAGE,
      page: () => QuestionPage(),
      binding: QuestionBinding(),
    ),
    GetPage(
      name: Routes.FINISH_PAGE,
      page: () => FinishPage(),
    ),
    GetPage(
      name: Routes.RESULT_PAGE,
      page: () => ResultPage(),
    ),
  ];
}
