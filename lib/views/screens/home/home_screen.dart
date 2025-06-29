import 'package:danceattix/views/widgets/cachanetwork_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';


import '../../../core/app_constants/app_colors.dart';
import '../../../core/config/app_route.dart';
import '../../../global/custom_assets/assets.gen.dart';
import '../../widgets/custom_product_card.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchCtrl = TextEditingController();

  List accessories = ["Accessories", "Clothing", "Pet beds", "All"];

  List categoryList = [
    {
      "title": "Leo tard",
      "image": "https://www.irealife.com/cdn/shop/articles/Top_10_Spring_Dresses_for_Women.jpg?v=1727179480"
    },
    {
      "title": "Dresses",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO4tTg47BvvepOyh9V-dEmXe0b65R_jFkWX0RV1u3hHisNTVPXqk3h0HiyKynTVoso0X0&usqp=CAU"
    },
    {
      "title": "Skirt",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO4tTg47BvvepOyh9V-dEmXe0b65R_jFkWX0RV1u3hHisNTVPXqk3h0HiyKynTVoso0X0&usqp=CAU"
    },
    {
      "title": "Dresses",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO4tTg47BvvepOyh9V-dEmXe0b65R_jFkWX0RV1u3hHisNTVPXqk3h0HiyKynTVoso0X0&usqp=CAU"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 44.h),
            Row(
              children: [


                Row(
                  children: [
                    CustomNetworkImage(
                      border:
                      Border.all(color: Color(0xff592B00), width: 2),
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
                            text: "Sagor Ahamed",
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            bottom: 6.h),
                        CustomText(
                            text: "hello how are you", fontSize: 12.h),
                      ],
                    ),
                    SizedBox(width: 8.w)
                  ],
                ),


                Spacer(),

                GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.cartScreen);
                    },
                    child: Assets.icons.card.svg()),

                SizedBox(width: 16.w),

                GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRoutes.notificationScreen);
                    },
                    child: Assets.icons.notification.svg()),


              ],
            ),
            SizedBox(height: 8.h),





            CustomText(
                text: "Popular category",
                fontWeight: FontWeight.w500,
                top: 10.h,
                bottom: 12.h,
                color: Color(0xff592B00)),
            SizedBox(
              height: 100.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Container(
                      width: 80.w,
                      decoration: BoxDecoration(
                        color: Color(0xffE6E6E4),
                        image: DecorationImage(image: NetworkImage("${categoryList[index]["image"]}"), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(8.r)

                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 60.h),
                   
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.r)
                              ),
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                                child: CustomText(
                                    text: categoryList[index]["title"],
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff592B00)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),


            SizedBox(height: 20.h),





            CustomTextField(
                controller: searchCtrl,
                hintextColor: Colors.black87,
                hintText: "Search by products name",
                suffixIcon: Assets.icons.searhIcon.svg()),




            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    text: "All Products",
                    fontSize: 16.h,
                    fontWeight: FontWeight.w500),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.allProductScreen);
                  },
                  child: CustomText(
                      text: "See all...",
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),



            Expanded(
              child: AnimationLimiter(
                child: ListView.builder(
                  itemCount: 50,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
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
}
