import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myy_app/apis/dummy_ui.dart';
import 'package:myy_app/internet.dart';
import 'connectivity_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Network Connectivity',
      home: DummyView()
    );
  }
}
