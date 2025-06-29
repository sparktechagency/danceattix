

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/app_constants/app_colors.dart';
import '../../../../core/config/app_route.dart';
import '../../../../global/custom_assets/assets.gen.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_field.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passWordCtrl = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 170.h),

            Assets.images.logo.image(height: 112.h, width: 133.w, color: Colors.black),



            SizedBox(height: 60.h),

            /// <<< ============><>>> Login text flied  << < ==============>>>

            Container(
              height: 590.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                  color: Colors.white
              ),
              child: Column(
                children: [


                  CustomTextField(controller: emailCtrl,  hintText: "Enter your email", isEmail: true),

                  CustomTextField(controller: passWordCtrl, hintText: "Enter your password", isPassword: true),


                  SizedBox(height: 10.h),

                  Align(
                    alignment: Alignment.centerRight,
                    child: RichText(
                      text: TextSpan(
                        style:  TextStyle(
                          color: Colors.black87,
                          fontSize: 13.h,
                        ),
                        children: [

                          TextSpan(
                            text: 'Forgot Password?',
                            style:  TextStyle(
                              color: AppColors.primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                               Get.toNamed(AppRoutes.forgotScreen);
                              },
                          )
                        ],
                      ),
                    ),
                  ),






                  SizedBox(height: 100.h),

                  CustomButton(title: "Sign in", onpress: () {
                    Get.toNamed(AppRoutes.bottomNavBar);
                  }),



                  SizedBox(height: 24.h),

                  RichText(
                    text: TextSpan(
                      style:  TextStyle(
                        color: Colors.black87,
                        fontSize: 13.h,
                      ),
                      children: [
                        const TextSpan(text: 'Don’t have an account?  '),
                        TextSpan(
                          text: 'Sign Up',
                          style:  TextStyle(
                            color: AppColors.primaryColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(AppRoutes.signUpScreen);
                            },
                        )
                      ],
                    ),
                  ),



                  SizedBox(height: 40.h),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}




