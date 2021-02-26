import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  static const platform = const MethodChannel('MyNativeChannel');
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(title: Text('Native Call Demo')),
      body: Center(
        child: RaisedButton(child: Text('Call Native'), onPressed: () {

          getData();
        }),
      ),
    );
  }

  Future<void> getData() async {
    String message;
    try {
      message = await platform.invokeMethod('getData');
      print(message);
    } on PlatformException catch (e) {
      message = "Failed to get data from native : '${e.message}'.";
    }
  }
}
