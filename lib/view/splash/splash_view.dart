import 'package:flutter/material.dart';
import 'package:project/res/app_routes/app_routes_name.dart';
import 'package:project/res/app_text_style/app_text_style.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, AppRoutesName.homeView),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Text(
          "Md. Emon Miah \nTest Assignment",
          style: AppTextStyle.tittleBig2(),
        ),
      )),
    );
  }
}
