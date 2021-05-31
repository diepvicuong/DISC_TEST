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
        primarySwatch: Colors.blue,
      ),
      home: QuestionPage(),
      // initialBinding: HomeBinding(),
      initialRoute: Routes.INITIAL,
      // getPages: AppPages.pages,
    );
  }
}
