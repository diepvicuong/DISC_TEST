import 'dart:async';

import 'package:disc_test/app/common/custom_body_background.dart';
import 'package:disc_test/app/data/services/manger_service.dart';
import 'package:disc_test/app/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';

class CustomSpinWheel extends StatefulWidget {
  @override
  _CustomSpinWheelState createState() => _CustomSpinWheelState();
}

class _CustomSpinWheelState extends State<CustomSpinWheel> {
  late StreamController<int> controller;
  bool _isWheel = true;
  bool _isFinish = false;

  @override
  void initState() {
    super.initState();
    controller = StreamController<int>();
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 1,
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width,
              child: FortuneWheel(
                selected: controller.stream,
                animateFirst: _isWheel,
                // physics: NoPanPhysics(),
                duration: Duration(seconds: 10),
                items: ManagerService.instance.configuration.gift!
                    .map(
                      (element) => FortuneItem(
                        child:
                            element.image != null && element.image!.isNotEmpty
                                ? Image.network(
                                    element.image!,
                                    width: 50,
                                  )
                                : Text(
                                    (element.name ?? 'Vỗ tay').toUpperCase(),
                                    style: TextStyle(
                                        color: element.name != null
                                            ? Colors.black
                                            : Colors.white),
                                  ),
                      ),
                    )
                    .toList()
                      ..shuffle(),
                onFling: null,
                onAnimationEnd: () {
                  setState(() {
                    _isFinish = true;
                  });
                },
              ),
            ),
            TextButton(
                onPressed: () {
                  // if (_isWheel == false) {
                  //   setState(() {
                  //     _isWheel = true;
                  //     print('run');
                  //     Get.back();
                  //   });
                  // }
                  if (_isFinish) {
                    Get.back();
                  }
                },
                child: Text(
                  'Lưu món quà'.toUpperCase(),
                  style: AppStyle.buttonTextStyle
                      .copyWith(color: _isFinish ? Colors.black : Colors.grey),
                ))
          ],
        ),
      ),
    );
  }
}
