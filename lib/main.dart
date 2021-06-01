import 'package:disc_test/app/bindings/question_binding.dart';
import 'package:disc_test/app/ui/question/page/question_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.amber,
        primarySwatch: Colors.blue,
      ),
      home: QuestionPage(),
      initialBinding: QuestionBinding(),
      initialRoute: Routes.INITIAL,
      // getPages: AppPages.pages,
    );
  }
}
