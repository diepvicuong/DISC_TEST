import 'package:flutter/material.dart';

class CustomBackgroundContainer extends StatelessWidget {
  final Widget child;

  const CustomBackgroundContainer({Key? key, required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.9), BlendMode.dstATop),
          )),
      child: child,
    );
  }
}
