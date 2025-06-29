
import 'package:danceattix/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../core/app_constants/app_colors.dart';
import '../../../core/config/app_route.dart';
import '../../../global/custom_assets/assets.gen.dart';
import '../../widgets/custom_text.dart';




class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});




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
              "assets/images/onboardingBg.png",
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
                    maxline: 3,
                    textAlign: TextAlign.start,
                    fontSize: 24.h,
                    color: Colors.white,
                    text:
                    "Buy, Sell, and Reimagine Fashion !!!",
                    fontWeight: FontWeight.w500,
                    top: 78.h,
                  ),
                  SizedBox(height: 13.h),


                  CustomText(
                    maxline: 10,
                    fontSize: 12.h,
                    bottom: 37.h,
                    textAlign: TextAlign.start,
                    color: Colors.white,
                    text:
                    "Buy and sell new or pre-loved clothes easily, with secure transactions and a wide variety of stylish options.",
                    fontWeight: FontWeight.w500,
                  ),





                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 7,
                          offset: Offset(-1, 1)
                        )
                      ]
                    ),
                    child: CustomButton(title: "Start Your Journey", onpress: () {
                      Get.toNamed(AppRoutes.logInScreen);
                    }),
                  )



                ],
              ),
            ),
          ],
        ),
      ),
    );
  }}