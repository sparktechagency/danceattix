// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:get/get.dart';
//
// import '../../../core/config/app_route.dart';
// import '../../../global/custom_assets/assets.gen.dart';
// import '../../widgets/custom_app_bar.dart';
// import '../../widgets/custom_button.dart';
// import '../../widgets/custom_product_card.dart';
// import '../../widgets/custom_text.dart';
// import '../../widgets/custom_text_field.dart';
//
// class AllProductScreen extends StatefulWidget {
//   AllProductScreen({super.key});
//
//   @override
//   State<AllProductScreen> createState() => _AllProductScreenState();
// }
//
// class _AllProductScreenState extends State<AllProductScreen> {
//   final TextEditingController searchCtrl = TextEditingController();
//
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   double minPrice = 5;
//   double maxPrice = 20;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       endDrawer: SizedBox(
//         width: 300.w,
//         child: Drawer(
//           backgroundColor: Colors.white,
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: ListView(
//               children: [
//
//                 CustomText(text: "Filler", fontSize: 20.h, fontWeight: FontWeight.w600, color: Color(0xff592B00)),
//
//
//                  SizedBox(height: 20.h),
//
//                 /// Category
//
//                 CustomText(text: "Category", color: Colors.black, textAlign: TextAlign.start),
//
//                 SizedBox(height: 10.h),
//                 Wrap(
//                   spacing: 10,
//                   runSpacing: 10,
//                   children: [
//                     categoryButton("Cat", true),
//                     categoryButton("Dog"),
//                     categoryButton("Bird"),
//                     categoryButton("Fish"),
//                     categoryButton("All"),
//                   ],
//                 ),
//
//                  SizedBox(height: 25.h),
//
//                 /// Usability
//                 CustomText(text: "Usability", color: Colors.black, textAlign: TextAlign.start),
//                 SizedBox(height: 10.h),
//                 Wrap(
//                   spacing: 10,
//                   runSpacing: 10,
//                   children: [
//                     categoryButton("100%", true),
//                     categoryButton("80%-99%"),
//                     categoryButton("60%-79%"),
//                     categoryButton("<60%"),
//                     categoryButton("All"),
//                   ],
//                 ),
//
//                  SizedBox(height: 25.h),
//
//                 /// Price Range
//                 CustomText(text: "Price Range", color: Colors.black, textAlign: TextAlign.start),
//                  SizedBox(height: 10.h),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("${minPrice.toInt()} \$"),
//                     Text("${maxPrice.toInt()} \$"),
//                   ],
//                 ),
//                 SliderTheme(
//                   data: SliderTheme.of(context).copyWith(
//                     activeTrackColor: Colors.orange,
//                     inactiveTrackColor: Colors.grey[300],
//                     thumbColor: Colors.orange,
//                   ),
//                   child: RangeSlider(
//                     values: RangeValues(minPrice, maxPrice),
//                     min: 0,
//                     max: 100,
//                     divisions: 20,
//                     onChanged: (values) {
//                       setState(() {
//                         minPrice = values.start;
//                         maxPrice = values.end;
//                       });
//                     },
//                   ),
//                 ),
//
//                  SizedBox(height: 80.h),
//
//                 /// Apply Button
//                 Padding(
//                   padding:  EdgeInsets.symmetric(horizontal: 30.w),
//                   child: CustomButton(
//                       title: "Apply", onpress: () {
//
//                   }),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//       appBar: CustomAppBar(title: "All Product"),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 24.w),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 SizedBox(
//                   width: 300.w,
//                   child: CustomTextField(
//                     controller: searchCtrl,
//                     prefixIcon: Icon(Icons.search_rounded),
//                     hintText: "Search For Pet Product",
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     _scaffoldKey.currentState?.openEndDrawer();
//                   },
//                   child: Padding(
//                     padding: EdgeInsets.only(left: 16.w, bottom: 16.h),
//                     child: Assets.icons.filterIcon.svg(),
//                   ),
//                 ),
//               ],
//             ),
//             Expanded(
//               child: AnimationLimiter(
//                 child: GridView.builder(
//                   itemCount: 50,
//                   padding: EdgeInsets.symmetric(vertical: 1.h),
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 10,
//                     childAspectRatio: 0.868,
//                   ),
//                   itemBuilder: (context, index) {
//                     return CustomProductCard(
//                       index: index,
//                       isFavorite: true,
//                       title: "Cat Travel Bag",
//                       address: "Dhaka",
//                       price: "30",
//                       onTap: () {Get.toNamed(AppRoutes.productDetailsScreen);},
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//
//
//   Widget categoryButton(String text, [bool selected = false]) {
//     return Container(
//       decoration: BoxDecoration(
//         color: selected ? Colors.orange : Colors.transparent,
//         border: Border.all(color: Colors.orange),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: CustomText(text: text, color: selected ? Colors.white : Colors.orange, left: 32.w, right: 32.w, top: 4.h, bottom: 4.h)
//     );
//   }
//
// }
//




import 'package:danceattix/core/app_constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../core/config/app_route.dart';
import '../../../global/custom_assets/assets.gen.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_product_card.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field.dart';

class AllProductScreen extends StatefulWidget {
  AllProductScreen({super.key});

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  final TextEditingController searchCtrl = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  double minPrice = 5;
  double maxPrice = 20;

  List<String> sizes = [
    "Small(S)", "Medium(M)", "Large(L)", "X-Large(XL)", "XX-Large(XXL)", "XXX-Large(XXXL)"
  ];
  List<String> selectedSizes = [];

  List<String> categories = [
    "Salsa Dress",
    "Ballet Leotard",
    "Dance Tights",
    "Jazz Pants",
    "Tap Shoes",
    "Tango Skirt",
    "Ballroom Set",
    "Hip Hop Top",
  ];
  List<String> selectedCategories = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: SizedBox(
        width: 300.w,
        child: Drawer(
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [

                CustomText(
                    text: "Filter",
                    fontSize: 20.h,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff592B00)),

                SizedBox(height: 20.h),

                /// Price Range
                CustomText(text: "Price Range", color: Colors.black),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${minPrice.toInt()} \$"),
                    Text("${maxPrice.toInt()} \$"),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: AppColors.primaryColor,
                    inactiveTrackColor: Colors.grey[300],
                    thumbColor: AppColors.primaryColor,
                  ),
                  child: RangeSlider(
                    values: RangeValues(minPrice, maxPrice),
                    min: 0,
                    max: 100,
                    divisions: 20,
                    onChanged: (values) {
                      setState(() {
                        minPrice = values.start;
                        maxPrice = values.end;
                      });
                    },
                  ),
                ),

                SizedBox(height: 20.h),

                /// Size
                CustomText(text: "Size", color: Colors.black),
                SizedBox(height: 10.h),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: sizes.map((size) {
                    final isSelected = selectedSizes.contains(size);
                    return categoryButton(size, isSelected, () {
                      setState(() {
                        isSelected
                            ? selectedSizes.remove(size)
                            : selectedSizes.add(size);
                      });
                    });
                  }).toList(),
                ),

                SizedBox(height: 20.h),

                /// Category
                CustomText(text: "Category", color: Colors.black),
                SizedBox(height: 10.h),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: categories.toSet().map((cat) {
                    final isSelected = selectedCategories.contains(cat);
                    return categoryButton(cat, isSelected, () {
                      setState(() {
                        isSelected
                            ? selectedCategories.remove(cat)
                            : selectedCategories.add(cat);
                      });
                    });
                  }).toList(),
                ),

                SizedBox(height: 40.h),

                /// Apply Button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: CustomButton(
                    title: "Apply",
                    onpress: () {
                      // Apply filter logic here
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),



      appBar: AppBar(
        title: CustomText(text: "All Products", fontSize: 16.h),
        actions: [
          GestureDetector(
              onTap: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
              child: Assets.icons.filterIcon.svg(color: Colors.black)),

          SizedBox(width: 24.w)
        ],
      ),


      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [

            SizedBox(height: 12.h),


            CustomTextField(
                controller: searchCtrl,
                hintextColor: Colors.black87,
                hintText: "Search by products name",
                suffixIcon: Assets.icons.searhIcon.svg()),

            Expanded(
              child: AnimationLimiter(
                child: ListView.builder(
                  itemCount: 50,
                  padding: EdgeInsets.symmetric(vertical: 0.h),
                  itemBuilder: (context, index) {
                    return CustomProductCard(
                      index: index,
                      leftBtnName: "Buy now",
                      rightBtnName: "Make Offer",
                      isBookMarkNeed: true,
                      isFavorite: true,
                      title: "Cat Travel Bag",
                      price: "30",
                      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO4tTg47BvvepOyh9V-dEmXe0b65R_jFkWX0RV1u3hHisNTVPXqk3h0HiyKynTVoso0X0&usqp=CAU",
                      onTap: () {
                        Get.toNamed(AppRoutes.productDetailsScreen);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget categoryButton(String text, bool selected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryColor : Colors.transparent,
          border: Border.all(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(20),
        ),
        child: CustomText(
          text: text,
          color: selected ? Colors.white : Colors.black,
          left: 10.w,
          right: 10.w,
          top: 4.h,
          bottom: 4.h,
        ),
      ),
    );
  }

}

