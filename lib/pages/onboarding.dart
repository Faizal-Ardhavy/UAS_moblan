import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/core/res/app.dart';
import 'package:task_management/core/res/color.dart';
import 'package:task_management/core/routes/routes.dart';
import 'package:task_management/widgets/circle_gradient_icon.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, Routes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Image.asset(
          'assets/svg/LOGO-UNILA.png'
        , fit: BoxFit.fitWidth,));
  }
}
