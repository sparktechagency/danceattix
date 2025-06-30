import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../../../core/app_constants/app_colors.dart';
import '../../../core/config/app_route.dart';
import '../../widgets/cachanetwork_image.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Wallet"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
                text: "Overview",
                color: Colors.black,
                fontSize: 20.h,
                fontWeight: FontWeight.w600,
                top: 14.h,
                bottom: 16.h),
            Container(
              height: 150.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/walletBg.png"))),
              child: Padding(
                padding: EdgeInsets.all(19.r),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                              text: "Available Balance",
                              fontSize: 20.h,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                          CustomText(
                              text: "\$ 12000",
                              fontSize: 36.h,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffFFD6B0),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.h, horizontal: 22.w),
                          child: CustomText(
                              text: "Withdraw Now",
                              fontSize: 12.h,
                              color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    text: "History",
                    fontSize: 17.h,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.walletHistoryScreen);
                  },
                  child: CustomText(
                      text: "More...",
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(3.r),
                    padding:
                        EdgeInsets.symmetric(vertical: 7.h, horizontal: 7.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.2), width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CustomNetworkImage(
                          border:
                              Border.all(color: Color(0xff592B00), width: 3),
                          imageUrl: "https://i.pravatar.cc/150?img=3",
                          height: 58.h,
                          width: 58.w,
                          boxShape: BoxShape.circle,
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                text: "Jeorge Mayank",
                                fontWeight: FontWeight.w500,
                                bottom: 6.h),
                            CustomText(
                                text: "Transition id: 4524214212",
                                fontSize: 12.h),
                            CustomText(text: "21 April 2025", fontSize: 12.h),
                          ],
                        ),
                        Spacer(),
                        CustomText(
                            text: "\$ 25",
                            fontSize: 28.h,
                            color: Colors.black),
                        SizedBox(width: 8.w)
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
