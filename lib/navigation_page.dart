import 'package:disc_test/app/common/custom_appbar.dart';
import 'package:disc_test/app/routes/app_pages.dart';
import 'package:disc_test/app/ui/welcome/page/help_page.dart';
import 'package:disc_test/app/ui/welcome/page/welcome_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class NavigatorPage extends StatefulWidget {
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  final tag = '_NavigatorPageState';
  var a = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
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
          ),
          Builder(
            builder: (context) {
              return Navigator(
                // key: Get.nestedKey(MyConstants.keyNavigator),
                onGenerateRoute: (route) {
                  // printLog(tag: tag, message: 'generate route');
                  print('${route.name}');
                  if (route.name == Routes.INITIAL) {
                    return GetPageRoute(
                      page: () => WelcomePage(),
                      transitionDuration: Duration(milliseconds: 100),
                      // binding: HomeBinding(),
                    );
                  } else if (route.name == Routes.LOGIN_PAGE) {
                    return GetPageRoute(
                        page: () => HelpPage(),
                        // transitionDuration: Duration(milliseconds: 100),
                        transition: Transition.downToUp);
                  }
                },

                // initialRoute: Routes.INITIAL,
              );
            },
          ),
        ],
      ),
    );
  }
}
