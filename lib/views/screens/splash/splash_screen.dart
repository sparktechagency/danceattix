import 'package:danceattix/core/app_constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/config/app_route.dart';
import '../../../global/custom_assets/assets.gen.dart';
import '../../widgets/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
       return Get.offAllNamed(AppRoutes.onboardingScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            // Background Image
            Image.asset(
              "assets/images/splashBg.png",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),

            // Gradient Overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x00737373), // Fully transparent gray
                    Color(0xFF017783), // Solid teal
                  ],
                ),
              ),
            ),

            // Foreground content
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 300.h),
                  Assets.images.logo.image(height: 112.h, width: 132.w),
                  CustomText(
                    maxline: 10,
                    fontSize: 16.h,
                    color: Colors.white,
                    text:
                    "Buy and sell new or pre-loved clothes easily, with secure transactions and a wide variety of stylish options.",
                    fontWeight: FontWeight.w500,
                    top: 120.h,
                  ),
                  SizedBox(height: 40.h),
                  Container(
                    height: 20.h,
                    width: 20.w,
                    decoration: BoxDecoration(
                      color: Color(0xff00B9FF),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }}