import 'package:disc_test/app/bindings/question_binding.dart';
import 'package:disc_test/app/ui/finish/page/finish_page.dart';
import 'package:disc_test/app/ui/finish/page/result_page.dart';
import 'package:disc_test/app/ui/finish/page/send_page.dart';
import 'package:disc_test/app/ui/login/page/login_page.dart';
import 'package:disc_test/app/ui/login/page/start_page.dart';
import 'package:disc_test/app/ui/question/page/question_page.dart';
import 'package:disc_test/app/ui/welcome/page/help_page.dart';
import 'package:disc_test/app/ui/welcome/page/welcome_page.dart';
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
      transition: Transition.downToUp,
    ),
    GetPage(
      name: Routes.LOGIN_PAGE,
      page: () => LoginPage(),
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
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: Routes.SEND_PAGE,
      page: () => SendPage(),
      transition: Transition.rightToLeftWithFade,
    ),
  ];
}
