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
      name: Routes.HELP,
      page: () => HelpPage(),
    )
  ];
}
