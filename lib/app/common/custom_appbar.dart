import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppbarBackBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.chevron_left),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }
}

class AppbarTransparent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarOpacity: 0.0,
    );
  }
}
