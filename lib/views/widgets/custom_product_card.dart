
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/app_constants/app_colors.dart';
import '../../global/custom_assets/assets.gen.dart';
import 'cachanetwork_image.dart';
import 'custom_button.dart';
import 'custom_text.dart';
import 'custom_text_field.dart';

class CustomProductCard extends StatelessWidget {
  final int? index;
  final String? title;
  final String? price;
  final String? image;
  final String? leftBtnName;
  final String? rightBtnName;
  final bool? isFavorite;
  final bool? isBookMarkNeed;
  final VoidCallback? onTap;

  const CustomProductCard(
      {super.key,
        this.index,
        this.title,
        this.price,
        this.image,
        this.isFavorite,
        this.onTap, this.leftBtnName, this.rightBtnName, this.isBookMarkNeed});

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredGrid(
      position: index ?? 0,
      columnCount: 2,
      duration: Duration(milliseconds: 500),
      child: SlideAnimation(
        verticalOffset: 50,
        child: SlideAnimation(
          delay: Duration(milliseconds: 275),
          child: GestureDetector(
            onTap: onTap,
            child:  Container(
              margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 3.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: Offset(0, 0), // shadow in all directions
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(6.r),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Section

                    CustomNetworkImage(
                        borderRadius: BorderRadius.circular(8.r),
                        imageUrl: "$image",
                        height: 139.h,
                        width: 102.w),

                    SizedBox(width: 7.w),

                    // Info Section
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          SizedBox(height: 8.h),

                          Row(
                            children: [
                              CustomText(
                                  text: "$title",
                                  fontWeight: FontWeight.w600,
                                  bottom: 4.h,
                                  color: Colors.black),


                              Spacer(),

                              if(isBookMarkNeed ?? false)
                                Icon(Icons.favorite, color: Colors.red)

                            ],
                          ),
                          SizedBox(width: 4.w),
                          CustomText(
                            text: "Price: 30\$",
                            fontWeight: FontWeight.w500
                          ),
                          CustomText(
                            maxline: 7,
                              text: "Transform your look with expert cuts, styling, and personalized service at our premier salon, designed for your ultimate satisfaction.",
                              fontSize: 8.h,
                              textAlign: TextAlign.start,
                              bottom: 4.h,
                              color: Colors.black),


                          SizedBox(height: 16.h),

                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: CustomButton(
                                    height: 26.h,
                                    title: "$leftBtnName",
                                    onpress: () {},
                                    fontSize: 10.h,
                                    loaderIgnore: true),
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                flex: 1,
                                child: CustomButton(
                                    loading: false,
                                    loaderIgnore: true,
                                    height: 26.h,
                                    title: "$rightBtnName",
                                    onpress: () {},
                                    fontSize: 10.h),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ),
        ),
      ),
    );
  }
}
