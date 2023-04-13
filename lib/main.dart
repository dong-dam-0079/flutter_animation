import 'package:flutter/material.dart';
import 'package:flutter_animation/view/login/login_view.dart';
import 'package:get/get.dart';

import 'res/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.commonThemeData(context),
      home: const LoginView(),
    );
  }
}
