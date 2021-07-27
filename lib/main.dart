import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_web_app/LayoutTemplet.dart';
import 'package:task_web_app/Screen/HomeScreen.dart';

import 'Models/Detailtems.dart';
import 'locator.dart';

void main() {
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LayoutTemplet(),
    );
  }
}
