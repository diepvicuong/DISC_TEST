  import 'package:flutter/material.dart';

class Utils{
    static Future<void> showLoadingDialog(
          BuildContext context) async {
        return showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return new WillPopScope(
                  onWillPop: () async => false,
                  child: SimpleDialog(
                      // backgroundColor: Colors.black54,
                      children: <Widget>[
                        Center(
                          child: Column(children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 10,),
                            Text("Xin đợi trong giây lát....",style: TextStyle(color: Colors.blueAccent),)
                      ]),
                  )
              ]));
          });
      }
  }
  