import 'package:cots/modules/homepage/views/homepage_view.dart';
import 'package:cots/modules/onboarding/views/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Onboarding App',
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
