import 'dart:io';

import 'package:danceattix/views/widgets/custom_app_bar.dart';
import 'package:danceattix/views/widgets/custom_button.dart';
import 'package:danceattix/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../global/custom_assets/assets.gen.dart';
import '../../widgets/custom_text.dart';

class CreateProductScreen extends StatefulWidget {
  const CreateProductScreen({super.key});

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  final TextEditingController titleNameCtrl = TextEditingController();
  final TextEditingController categoryCtrl = TextEditingController();
  final TextEditingController conditionCtrl = TextEditingController();
  final TextEditingController priceTypeCtrl = TextEditingController();
  final TextEditingController brandNameCtrl = TextEditingController();
  final TextEditingController sizesCtrl = TextEditingController();
  final TextEditingController purchasePriceCtrl = TextEditingController();
  final TextEditingController sellingPriceCtrl = TextEditingController();

  List<String> categoryList = [
    'Brand New',
    'Use less than 6 month',
    'Use less than 1 years',
    'Use more then 1 years'
  ];


  List<String> priceTypeList = [
    'Negotiable',
    'Fixed'
  ];

  List<String> brandNamesList = [
    'Lotto',
    'Zara',
    'Easy',
    'Puma',
    'Adidas',
    'No tags',
  ];

  List<String> sizeList = [
    'Small (S)',
    'Medium (M)',
    'Large (L)',
    'X-Large (XL)',
    'XX-Large (XXL)',
    'XXX-Large (XXXL)',

  ];


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Add Products"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              CustomTextField(
                controller: titleNameCtrl,
                shadowNeed: false,
                labelText: "Title or name",
                hintText: "product title or name",
              ),
          
          
          
              SearchableDropdownTextField(
                controller: categoryCtrl,
                labelText: "Category",
                hintText: "Select Category",
                items: categoryList,
              ),
          
          
              CustomTextField(
                controller: conditionCtrl,
                shadowNeed: false,
                labelText: "Condition",
                hintText: "condition",
              ),
          
          
          
              SearchableDropdownTextField(
                controller: priceTypeCtrl,
                labelText: "Price type",
                hintText: "Select price type",
                items: priceTypeList,
              ),
          
          
          
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
          
                  Expanded(
                      flex: 1,
                      child: SearchableDropdownTextField(
                        controller: brandNameCtrl,
                        labelText: "Brand Names",
                        hintText: "Select brand name",
                        items: brandNamesList,
                      ),
                  ),
          
          
                  SizedBox(width: 12.w),
          
                  Expanded(
                    flex: 1,
                    child: SearchableDropdownTextField(
                      controller: sizesCtrl,
                      labelText: "Sizes",
                      hintText: "Select size",
                      items: sizeList,
                    ),
                  ),
          
                ],
              ),
          
          
          
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
          
                  Expanded(
                    flex: 1,
                    child: CustomTextField(
                      shadowNeed: false,
                      controller: purchasePriceCtrl,
                      labelText: "Purchase Price",
                      hintText: "purchase price"
                    ),
                  ),
          
          
                  SizedBox(width: 12.w),
          
                  Expanded(
                    flex: 1,
                    child: CustomTextField(
                      shadowNeed: false,
                      controller: sellingPriceCtrl,
                      labelText: "Selling Price",
                      hintText: "selling price"
                    ),
                  ),
          
                ],
              ),
          
          
          
          
          
          
          
          
              CustomText(
                  text: "Upload Images",
                  color: Colors.black,
                  fontSize: 16.h,
                  top: 8.h,
                  bottom: 10.h),
          
          
              GestureDetector(
                onTap: _pickImages,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                      borderRadius: BorderRadius.circular(14.r)),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 13.h),
                      child: Assets.icons.arrowTop.svg(),
                    ),
                  ),
                ),
              ),
          
          
              if (_images.isNotEmpty)
                Padding(
                  padding:  EdgeInsets.only(top: 12.h),
                  child: SizedBox(
                    height: 60.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _images.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 4.w),
                                width: 60.h,
                                height: 60.h,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _currentIndex == index ? Colors.blue : Colors.grey,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: Image.file(
                                    _images[index],
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 2,
                                right: 2,
                                child: GestureDetector(
                                  onTap: () => _removeImage(index),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.close,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
          
          
          
          
              SizedBox(height: 40.h),
          
          
              CustomButton(title: "Save and Continue", onpress: () {
          
              }),
          
          
              SizedBox(height: 100.h)
          
          
            ],
          ),
        ),
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
}




class SearchableDropdownTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final List<String> items;
  final Function(String)? onChanged;

  const SearchableDropdownTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.items,
    this.onChanged,
  });

  @override
  State<SearchableDropdownTextField> createState() => _SearchableDropdownTextFieldState();
}

class _SearchableDropdownTextFieldState extends State<SearchableDropdownTextField> {
  final RxBool isDropdownOpen = false.obs;
  final RxList<String> filteredItems = <String>[].obs;


  void searchItems(String text) {
      filteredItems.assignAll(widget.items);
  }


  @override
  void initState() {
    super.initState();
    filteredItems.assignAll(widget.items);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            isDropdownOpen.value = true;
            searchItems(widget.controller.text);
          },
          child: AbsorbPointer(
            child: CustomTextField(
              controller: widget.controller,
              labelText: widget.labelText,
              hintText: widget.hintText,
              shadowNeed: false,
              onChanged: (value) {
                searchItems(value);
                isDropdownOpen.value = true;
                if (widget.onChanged != null) widget.onChanged!(value);
              },
              suffixIcon: Padding(
                padding: EdgeInsets.all(16.r),
                child: Icon(Icons.keyboard_arrow_down_rounded),
              ),
            ),
          ),
        ),
        Obx(() {
          if (!isDropdownOpen.value || filteredItems.isEmpty) return const SizedBox();
          return Container(
            margin: EdgeInsets.only(top: 4.h),
            height: 200.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white,
              border: Border.all(color: Colors.black.withOpacity(0.2)),
            ),
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return InkWell(
                  onTap: () {
                    widget.controller.text = item;
                    isDropdownOpen.value = false;
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    child: CustomText(
                      text: item,
                      textAlign: TextAlign.start,
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ],
    );
  }
}
