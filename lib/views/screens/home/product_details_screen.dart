import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_constants/app_colors.dart';
import '../../widgets/cachanetwork_image.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';

class ProductDetailsScreen extends StatelessWidget {
   ProductDetailsScreen({super.key});

  List<String> sizes = [
    "Category : Skirt", "Brand: Lotto", "Sizes: S(Small)", "Purchase price :  \$46", "Condition : Brand New", "Price type :  Negotiable"
  ];
   List<String> selectedSizes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Product Details"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomNetworkImage(
                  height: 216.h,
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(10.r),
                  imageUrl:
                      "https://www.petzlifeworld.in/cdn/shop/files/51e-nUlZ50L.jpg?v=1719579773"),


              SizedBox(
                height: 20.h
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      text: "Sheath Dress",
                      fontSize: 24.h,
                      fontWeight: FontWeight.w700),

                  CustomText(
                      text: "\$21",
                      fontSize: 24.h,
                      fontWeight: FontWeight.w700),
                ],
              ),


              SizedBox(
                  height: 20.h
              ),

              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: sizes.map((size) {
                  final isSelected = selectedSizes.contains(size);
                  return categoryButton(size, isSelected, () {

                      isSelected
                          ? selectedSizes.remove(size)
                          : selectedSizes.add(size);

                  });
                }).toList(),
              ),


              SizedBox(
                  height: 20.h
              ),


              CustomText(text: "Delivery system", fontSize: 18.h),


              CustomText(text: "Delivery system", fontSize: 18.h),

              CustomText(
                maxline: 100,
                  textAlign: TextAlign.start,
                  text: "This facial cream is specially formulated to target and reduce dark spots, blemishes, and uneven skin tone. With its powerful ingredients, it helps fade discoloration and promotes a smoother, clearer complexion. Suitable for daily use, it nourishes the skin while working effectively to diminish spots and improve overall skin appearance. This facial cream is specially formulated to target and reduce dark spots, blemishes, and uneven skin tone. With its powerful ingredients, it helps fade discoloration and promotes a smoother, clearer complexion. Suitable for daily use, it nourishes the skin while working effectively to diminish spots and improve overall skin appearance.", fontSize: 12.h),


              SizedBox(height: 40.h),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: CustomButton(
                          title: "Buy Now",
                          onpress: () {},
                          fontSize: 12.h)),
                  SizedBox(width: 10.w),
                  Expanded(
                      flex: 1,
                      child: CustomButton(
                          title: "Make Offer",
                          onpress: () {},
                          fontSize: 12.h)),
                ],
              ),
              SizedBox(height: 60.h)
            ],
          ),
        ),
      ),
    );
  }

   Widget categoryButton(String text, bool selected, VoidCallback onTap) {
     return InkWell(
       onTap: onTap,
       child: Container(
         decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(16.r),
         ),
         child: CustomText(
           text: text,
           color:  Colors.black,
           fontSize: 12.h,
           left: 10.w,
           right: 10.w,
           top: 6.h,
           bottom: 6.h,
         ),
       ),
     );
   }
}
