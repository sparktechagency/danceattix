import 'dart:io';

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/app_constants/app_colors.dart';
import '../../../global/custom_assets/assets.gen.dart';
import '../../widgets/cachanetwork_image.dart';
import '../../widgets/cusotom_check_box.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Post"),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: ContainedTabBarView(
            tabBarProperties: TabBarProperties(
              height: 45.h,
              indicatorColor: Colors.orange,
              indicatorWeight: 3,
              labelColor: Colors.orange,
              unselectedLabelColor: Colors.black,
              labelStyle:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(fontSize: 14.sp),
            ),
            tabs: const [
              Text('        Create Post         '),
              Text('         My Post        '),
              Text('         My Sales       '),
            ],
            views: [
              _createPost(),
              _myPostList(),
              _mySalesList(_selected)
            ],
            onChange: (index) => print("Tab index changed to $index"),
          ),
        ));
  }




  TextEditingController titleCtrl = TextEditingController();
  TextEditingController locationCtrl = TextEditingController();
  TextEditingController conditionCtrl = TextEditingController();
  TextEditingController usageDurationCtrl = TextEditingController();
  TextEditingController expireDateCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController purchasePriceCtrl = TextEditingController();
  TextEditingController sellingPriceCtrl = TextEditingController();
  bool _isChecked = false;
  Widget _createPost() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10.h),
          Container(
            height: 230.h,
            width: double.infinity,
            // padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/images/uploadImage.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: _images.isEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: _pickImages,
                        child: Assets.icons.uploadPlusIcon
                            .svg(width: 44.w, height: 44.h),
                      ),
                      SizedBox(height: 10.h),
                      const Text("Upload up to 5 images"),
                    ],
                  )
                : Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.file(
                            _images[_currentIndex],
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // Left Arrow
                        Positioned(
                          left: 8.w,
                          child: GestureDetector(
                            onTap: _prevImage,
                            child: CircleAvatar(
                              radius: 14.r,
                              backgroundColor: Colors.black38,
                              child:
                                  Icon(Icons.arrow_left, color: Colors.white),
                            ),
                          ),
                        ),

                        // Right Arrow
                        Positioned(
                          right: 8.w,
                          child: GestureDetector(
                            onTap: _nextImage,
                            child: CircleAvatar(
                              radius: 14.r,
                              backgroundColor: Colors.black38,
                              child:
                                  Icon(Icons.arrow_right, color: Colors.white),
                            ),
                          ),
                        ),

                        // Remove Icon
                        Positioned(
                          top: 8.h,
                          right: 8.w,
                          child: GestureDetector(
                            onTap: () => _removeImage(_currentIndex),
                            child: CircleAvatar(
                              radius: 14.r,
                              backgroundColor: AppColors.primaryColor,
                              child: Icon(Icons.close,
                                  size: 14.r, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
          SizedBox(height: 18.h),
          CustomTextField(
              controller: titleCtrl,
              labelText: "Product Title",
              hintText: "Product Title"),
          CustomTextField(
              controller: locationCtrl,
              labelText: "Location",
              hintText: "Location"),
          CustomTextField(
              controller: conditionCtrl,
              labelText: "Condition",
              hintText: "Condition"),
          CustomTextField(
              controller: usageDurationCtrl,
              labelText: "Usage Duration",
              hintText: "Usage Duration"),
          CustomTextField(
              controller: expireDateCtrl,
              labelText: "Expire Data",
              hintText: "Expire Date"),


          Row(
            children: [

              Expanded(
                flex: 1,
                child: CustomTextField(
                    controller: purchasePriceCtrl,
                    labelText: "Purchase Price",
                    hintText: "Purchase Price"),
              ),

              SizedBox(width: 16.w),

              Expanded(
                flex: 1,
                child: CustomTextField(
                    controller: expireDateCtrl,
                    labelText: "Selling Price",
                    hintText: "Selling Price"),
              ),
            ],
          ),


          Row(
            children: [

              Spacer(),

              CircularCheckBox(
                size: 20.r,
                isChecked: _isChecked,
                onChanged: (value) {
                  setState(() {
                    _isChecked = value;
                  });
                },
              ),


              CustomText(text: "Negotiable", fontSize: 16.h, color: Colors.black,left: 10.w, right: 5.w),
            ],
          ),

          SizedBox(height: 16.h),

          CustomTextField(
              controller: descriptionCtrl,
              labelText: "Description",
              hintText: "Description"),
          CustomButton(title: "Create a Post", onpress: () {}),
          SizedBox(height: 120.h)
        ],
      ),
    );
  }

  final ImagePicker _picker = ImagePicker();

  List<File> _images = [];

  int _currentIndex = 0;

  Future<void> _pickImages() async {
    final List<XFile>? picked = await _picker.pickMultiImage();
    if (picked != null) {
      final newImages = picked.map((x) => File(x.path)).toList();
      setState(() {
        final remaining = 5 - _images.length;
        _images.addAll(newImages.take(remaining));
        _currentIndex = _images.length - 1;
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index);
      if (_images.isNotEmpty) {
        _currentIndex = index > 0 ? index - 1 : 0;
      } else {
        _currentIndex = 0;
      }
    });
  }

  void _nextImage() {
    if (_currentIndex < _images.length - 1) {
      setState(() {
        _currentIndex++;
      });
    }
  }

  void _prevImage() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    }
  }




  Widget _myPostList() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 20.h),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 3.w),
          decoration: BoxDecoration(
            color: const Color(0xfffef4ea), // Card background
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
            padding: EdgeInsets.all(10.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Section

                CustomNetworkImage(
                    borderRadius: BorderRadius.circular(8.r),
                    imageUrl:
                        "https://www.petzlifeworld.in/cdn/shop/files/51e-nUlZ50L.jpg?v=1719579773",
                    height: 139.h,
                    width: 109.w),

                SizedBox(width: 7.w),

                // Info Section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        children: [
                          CustomText(
                              text: "Cat Travel Bag (Used)",
                              fontWeight: FontWeight.w600,
                              bottom: 4.h,
                              color: Colors.black),
                          Spacer(),

                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffD1F5D3), // Card background
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

                            child: CustomText(text: "Live", left: 8.w, right: 8.w,),
                          ),
                        ],
                      ),



                      Row(
                        children: [
                          Assets.icons.moneyIconCard.svg(),
                          SizedBox(width: 4.w),
                          CustomText(
                            text: "30\$",
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                          ),
                        ],
                      ),
                      CustomText(
                          text: "Pet Type: Cat",
                          fontSize: 12.h,
                          bottom: 4.h,
                          color: Colors.black),
                      CustomText(
                        text: "Condition: Used – 60% Usable",
                        fontSize: 12.h,
                        bottom: 4.h,
                        color: Colors.black,
                      ),
                      CustomText(
                        text: "Location: Banani, Dhaka",
                        fontSize: 12.h,
                        color: Colors.black,
                        bottom: 7.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: CustomButton(
                                height: 26.h,
                                title: "Edit",
                                onpress: () {},
                                color: Colors.transparent,
                                fontSize: 11.h,
                                loaderIgnore: true,
                                boderColor: AppColors.primaryColor,
                                titlecolor: AppColors.primaryColor),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            flex: 1,
                            child: CustomButton(
                                loading: false,
                                loaderIgnore: true,
                                height: 26.h,
                                title: "Delete",
                                onpress: () {},
                                fontSize: 11.h),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }





  final List<String> _options = ['In Progress', 'Packed', 'Handover'];
  String _selected = 'In Progress';
  Widget _mySalesList(String? selectedItem) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 20.h),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 3.w),
          decoration: BoxDecoration(
            color: const Color(0xfffef4ea), // Card background
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
            padding: EdgeInsets.all(10.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Section

                CustomNetworkImage(
                    borderRadius: BorderRadius.circular(8.r),
                    imageUrl:
                    "https://www.petzlifeworld.in/cdn/shop/files/51e-nUlZ50L.jpg?v=1719579773",
                    height: 139.h,
                    width: 109.w),

                SizedBox(width: 7.w),

                // Info Section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        children: [
                          CustomText(
                              text: "Cat Travel Bag (Used)",
                              fontWeight: FontWeight.w600,
                              bottom: 4.h,
                              color: Colors.black),
                          Spacer(),

                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffD1F5D3), // Card background
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

                            child: CustomText(text: "Live", left: 8.w, right: 8.w,),
                          ),
                        ],
                      ),



                      Row(
                        children: [
                          Assets.icons.moneyIconCard.svg(),
                          SizedBox(width: 4.w),
                          CustomText(
                            text: "30\$",
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                          ),
                        ],
                      ),
                      CustomText(
                          text: "Pet Type: Cat",
                          fontSize: 12.h,
                          bottom: 4.h,
                          color: Colors.black),
                      CustomText(
                        text: "Condition: Used – 60% Usable",
                        fontSize: 12.h,
                        bottom: 4.h,
                        color: Colors.black,
                      ),
                      CustomText(
                        text: "Location: Banani, Dhaka",
                        fontSize: 12.h,
                        color: Colors.black,
                        bottom: 7.h,
                      ),



                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 35.h,
                          padding:  EdgeInsets.symmetric(horizontal: 12.w),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEF4EA), // light background
                            border: Border.all(color: const Color(0xFFFF7A01)), // orange border
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectedItem,
                              icon: const Icon(Icons.arrow_drop_down, color: Color(0xFFFF7A01)),
                              dropdownColor: const Color(0xFFFEF4EA),
                              borderRadius: BorderRadius.circular(16),
                              style: const TextStyle(color: Colors.black),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    _selected = newValue;
                                  });
                                }
                              },
                              items: _options.map((String item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      )


                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
