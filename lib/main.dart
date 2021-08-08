import 'package:disc_test/app/module/login/bindings/login_binding.dart';
import 'package:disc_test/app/module/login/page/singup_page.dart';
import 'package:disc_test/app/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/module/welcome/page/welcome_page.dart';
import 'app/routes/app_pages.dart';

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
      initialBinding: LoginBinding(),
      getPages: AppPages.pages,
    );
  }
}
