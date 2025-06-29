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

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController addressCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController passWordCtrl = TextEditingController();
  final TextEditingController confirmPassWordCtrl = TextEditingController();
  RxBool isChecked = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 62.h),

            Assets.images.logo.image(height: 112.h, width: 133.w, color: Colors.black),

            SizedBox(height: 60.h),

            /// <<< ============><>>> Login text flied  << < ==============>>>




            Container(
              decoration: BoxDecoration(
                color: Color(0xffB0D5D9),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(40)),


              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [

                    SizedBox(height: 16.h),


                    CustomText(text: "Create Account", fontSize: 24.h, fontWeight: FontWeight.w600),


                    CustomText(
                      maxline: 2,
                      bottom: 10.h,
                      top: 12.h,
                      text: "Enter this information properly and get excited service properly !!!",),


                    CustomTextField(
                        controller: nameCtrl,
                        hintText: "Full name",
                        prefixIcon: Assets.icons.user.svg(color: Colors.black)),


                    CustomTextField(
                        controller: phoneCtrl,
                        hintText: "Phone No",
                        prefixIcon: Icon(Icons.phone_android)),

                    CustomTextField(
                        controller: emailCtrl,
                        hintText: "Valid email",
                        prefixIcon: Assets.icons.emailIcon.svg(),
                        isEmail: true),

                    CustomTextField(
                        controller: addressCtrl,
                        hintText: "Address",
                        prefixIcon: Assets.icons.phoneNo.svg()),


                    CustomTextField(
                        controller: passWordCtrl,
                        prefixIcon: Assets.icons.lock.svg(),
                        hintText: "New Password",
                        isPassword: true),
                    CustomTextField(
                        controller: confirmPassWordCtrl,
                        prefixIcon: Assets.icons.lock.svg(),
                        hintText: "Confirm password",
                        isPassword: true),


                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                              () => Transform.translate(
                            offset: const Offset(0, -18),
                            child: Checkbox(
                              value: isChecked.value,
                              onChanged: (value) {
                                isChecked.value = value!;
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 11.h,
                              ),
                              children: [
                                const TextSpan(text: 'By checking the box you agree to our '),
                                TextSpan(
                                  text: 'terms',
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Open Terms of Service
                                    },
                                ),
                                const TextSpan(text: ' and '),
                                TextSpan(
                                  text: 'Conditions.',
                                  style: const TextStyle(
                                    color: AppColors.primaryColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Open Privacy Policy
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),


                    CustomButton(title: "Sign up", onpress: () {
                      Get.toNamed(AppRoutes.optScreen, arguments: {"screenType" : "Sign up"});
                    }),

                    SizedBox(height: 16.h),

                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13.h,
                        ),
                        children: [
                          const TextSpan(text: 'Already a member?  '),
                          TextSpan(
                            text: 'Sign In',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(AppRoutes.logInScreen);
                              },
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: 40.h)


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
