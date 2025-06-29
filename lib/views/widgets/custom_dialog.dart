import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/app_constants/app_colors.dart';
import 'cachanetwork_image.dart';
import 'custom_button.dart';
import 'custom_text.dart';
import 'custom_text_field.dart';

class CustomDialog extends StatelessWidget {
  final TextEditingController? controller;
  const CustomDialog({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(
            text: "Offer Your Price",
            fontSize: 16.h,
            fontWeight: FontWeight.w600,
            top: 29.h,
            bottom: 20.h,
            color: Color(0xff592B00)),
        Divider(),
        SizedBox(height: 12.h),
        CustomTextField(
            controller: controller ?? TextEditingController(),
            labelText: "Enter Amount",
            hintText: "Enter Amount"),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: CustomButton(
                  height: 50.h,
                  title: "Cancel",
                  onpress: () {},
                  color: Colors.transparent,
                  fontSize: 11.h,
                  loaderIgnore: true,
                  boderColor: AppColors
                      .primaryColor,
                  titlecolor: AppColors
                      .primaryColor),
            ),
            SizedBox(width: 8.w),
            Expanded(
              flex: 1,
              child: CustomButton(
                  loading: false,
                  loaderIgnore: true,
                  height: 50.h,
                  title: "Offer",
                  onpress: () {},
                  fontSize: 11.h),
            ),
          ],
        )
      ],
    );
  }
}
