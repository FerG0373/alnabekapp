import 'package:flutter/material.dart';
import 'package:alnabekapp/res/app_imagespath.dart';
import 'package:alnabekapp/components/appbars.dart';
import 'package:alnabekapp/res/app_screenSize.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: Appbars.instertarLoginAppBar(context),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(AppImages.logo, width: AppScreenSize.getAverage(context) * 0.4, height: AppScreenSize.getAverage(context) * 0.4),
            
          ],
        )
      )
    );
  }
}