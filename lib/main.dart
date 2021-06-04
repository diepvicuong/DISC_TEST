import 'package:disc_test/app/bindings/question_binding.dart';
import 'package:disc_test/app/controllers/question/question_controller.dart';
import 'package:disc_test/app/res/colors.dart';
import 'package:disc_test/app/ui/login/page/login_page.dart';
import 'package:disc_test/app/ui/login/page/start_page.dart';
import 'package:disc_test/app/ui/question/page/question_page.dart';
import 'package:disc_test/app/ui/welcome/page/help_page.dart';
import 'package:disc_test/app/ui/welcome/page/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/ui/finish/page/finish_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: AppColor.kprimaryColor,
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
      initialRoute: Routes.INITIAL,
      getPages: AppPages.pages,
    );
  }
}
