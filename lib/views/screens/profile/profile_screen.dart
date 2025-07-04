import 'package:danceattix/core/app_constants/app_colors.dart';
import 'package:danceattix/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../../../core/config/app_route.dart';
import '../../../global/custom_assets/assets.gen.dart';
import '../../widgets/cachanetwork_image.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(
          children: [
            SizedBox(height: 70.h),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.profileInformationScreen);
              },
              child: CustomNetworkImage(
                border: Border.all(color: AppColors.primaryColor, width: 2),
                imageUrl: "https://i.pravatar.cc/150?img=3",
                height: 85.h,
                width: 85.w,
                boxShape: BoxShape.circle,
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.profileInformationScreen);
              },
              child: CustomText(
                top: 10.h,
                  text: "Sagor Ahamed",
                  fontSize: 24.h,
                  color: Color(0xff592B00),
                  bottom: 48.h),
            ),


            _customCart(
              title: "Profile Information",
              icon: Assets.icons.personalInfoIcon.svg(),
              onTap: () {
                Get.toNamed(AppRoutes.profileInformationScreen);
              },
            ),


            _customCart(
              title: "Wallet",
              icon: Assets.icons.walletIcon.svg(),
              onTap: () {
               Get.toNamed(AppRoutes.walletScreen);
              }),



              // _customCart(
              //   title: "Admin Support",
              //   icon: Assets.icons.wishListIcon.svg(),
              //   onTap: () {
              //     // Get.toNamed(AppRoutes.wishListScreen);
              //   },
              // ),



            _customCart(
              title: "Setting",
              icon: Assets.icons.settingIco.svg(),
              onTap: () {
                Get.toNamed(AppRoutes.settingScreen);
              },
            ),




            _customCart(
              title: "Logout",
              icon: Assets.icons.logout.svg(),
              onTap: () {

                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomText(
                              text: "Log Out",
                              fontSize: 16.h,
                              fontWeight: FontWeight.w600,
                              top: 20.h,
                              bottom: 12.h,
                              color: Color(0xff592B00)),
                          Divider(),
                          SizedBox(height: 12.h),
                          CustomText(
                            maxline: 2,
                            bottom: 20.h,
                            text: "Are you sure you want to sure Logout?",
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: CustomButton(
                                    height: 50.h,
                                    title: "Cancel",
                                    onpress: () {
                                      Get.back();
                                    },
                                    color: Colors.transparent,
                                    fontSize: 11.h,
                                    loaderIgnore: true,
                                    boderColor: Colors.black,
                                    titlecolor: Colors.black),
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                flex: 1,
                                child: CustomButton(
                                    loading: false,
                                    loaderIgnore: true,
                                    height: 50.h,
                                    color: Colors.red,
                                    boderColor: Colors.red,
                                    title: "Logout",
                                    onpress: () {
                                     Get.toNamed(AppRoutes.logInScreen);
                                    },
                                    fontSize: 11.h),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );


              },
            ),

          ],
        ),
      ),
    );
  }


  Widget _customCart(
      {required String title,
        required Widget icon,
        required VoidCallback onTap}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 9.h),
            child: Row(
              children: [
                icon,
                CustomText(text: "$title", color: Colors.black, left: 16.w),
                Spacer(),
                Assets.icons.rightArrow.svg(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _customCart(
  //     {required String title,
  //     required Widget icon,
  //     required VoidCallback onTap}) {
  //   return Padding(
  //     padding:  EdgeInsets.only(bottom: 12.h),
  //     child: GestureDetector(
  //       onTap: onTap,
  //       child: Card(
  //         color: Color(0xffFEF3EA),
  //         child: Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
  //           child: Row(
  //             children: [
  //               icon,
  //               CustomText(text: "$title", color: Colors.black, left: 16.w),
  //               Spacer(),
  //               Assets.icons.rightArrow.svg(),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
