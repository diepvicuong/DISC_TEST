import 'package:disc_test/app/res/sample_data.dart';
import 'package:disc_test/app/ui/question/page/answer_page.dart';
import 'package:flutter/material.dart';

class QuestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {},
        ),
        title: Container(
          color: Colors.amber,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: arrayData.length,
          itemBuilder: (context, index) {
            return AnswerPage(
              questionData: arrayData[index],
            );
          },
        ),
      ),
    );
  }
}
