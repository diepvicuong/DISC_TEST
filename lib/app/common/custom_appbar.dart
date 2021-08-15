import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppbarBackBtn extends StatelessWidget {
  final List<Widget>? action;

  const AppbarBackBtn({Key? key, this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !kIsWeb
        ? AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.chevron_left),
              onPressed: () {
                Get.back();
              },
            ),
            actions: this.action,
          )
        : SizedBox.shrink();
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
