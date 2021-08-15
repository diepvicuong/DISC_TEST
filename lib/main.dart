import 'package:disc_test/app/module/finish/page/result_page.dart';
import 'package:disc_test/app/module/login/bindings/login_binding.dart';
import 'package:disc_test/app/module/login/controller/login_controller.dart';
import 'package:disc_test/app/module/login/page/register_page.dart';
import 'package:disc_test/app/module/login/page/sigup_page.dart';
import 'package:disc_test/app/module/question/binding/question_binding.dart';
import 'package:disc_test/app/module/question/page/question_page.dart';
import 'package:disc_test/app/res/colors.dart';
import 'package:disc_test/app/test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/module/welcome/page/welcome_page.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
      // initialBinding: LoginBinding(),
      getPages: AppPages.pages,
    );
  }
}
