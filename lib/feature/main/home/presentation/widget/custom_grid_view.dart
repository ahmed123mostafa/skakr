import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/feature/main/home/presentation/screens/contet_product.dart';

class ContentGrid extends StatefulWidget {
  const ContentGrid({super.key});

  @override
  State<ContentGrid> createState() => _ContentGridState();
}

class _ContentGridState extends State<ContentGrid> {
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> _allItems = [
    {'title': 'offers'.tr(), 'image': AppAssets.offers},
    {
      'title': 'fruits_and_vegetables'.tr(),
      'image': AppAssets.fruitsandvegetables
    },
    {'title': 'fresh_food'.tr(), 'image': AppAssets.freshfood},
    {'title': 'baked'.tr(), 'image': AppAssets.baked},
    {'title': 'poultry_meat_seafood'.tr(), 'image': AppAssets.meat},
    {'title': 'ready_to_eat'.tr(), 'image': AppAssets.readytoeat},
    {'title': 'offers'.tr(), 'image': AppAssets.offers},
    {
      'title': 'fruits_and_vegetables'.tr(),
      'image': AppAssets.fruitsandvegetables
    },
    {'title': 'fresh_food'.tr(), 'image': AppAssets.freshfood},
    {'title': 'baked'.tr(), 'image': AppAssets.baked},
    {'title': 'poultry_meat_seafood'.tr(), 'image': AppAssets.meat},
    {'title': 'ready_to_eat'.tr(), 'image': AppAssets.readytoeat},
    {'title': 'offers'.tr(), 'image': AppAssets.offers},
    {
      'title': 'fruits_and_vegetables'.tr(),
      'image': AppAssets.fruitsandvegetables
    },
    {'title': 'fresh_food'.tr(), 'image': AppAssets.freshfood},
    {'title': 'baked'.tr(), 'image': AppAssets.baked},
    {'title': 'poultry_meat_seafood'.tr(), 'image': AppAssets.meat},
    {'title': 'ready_to_eat'.tr(), 'image': AppAssets.readytoeat},
    {'title': 'offers'.tr(), 'image': AppAssets.offers},
    {
      'title': 'fruits_and_vegetables'.tr(),
      'image': AppAssets.fruitsandvegetables
    },
    {'title': 'fresh_food'.tr(), 'image': AppAssets.freshfood},
    {'title': 'baked'.tr(), 'image': AppAssets.baked},
    {'title': 'poultry_meat_seafood'.tr(), 'image': AppAssets.meat},
    {'title': 'ready_to_eat'.tr(), 'image': AppAssets.readytoeat},
  ];

  List<Map<String, String>> _visibleItems = [];
  final int _initialItems = 8;
  bool _showAll = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadInitialItems();
    });
  }

  void _loadInitialItems() {
    final endIndex = _initialItems.clamp(0, _allItems.length);

    setState(() {
      _visibleItems = _allItems.sublist(0, endIndex);
      _showAll = false;
    });

    if (_allItems.isNotEmpty && _scrollController.hasClients) {
      _scrollToTop();
    }
  }

  void _loadAllItems() {
    if (_allItems.isEmpty) return;

    setState(() {
      _visibleItems = _allItems;
      _showAll = true;
    });
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));

    return Padding(
      padding: EdgeInsets.all(16.w),
      child: GridView.builder(
        controller: _scrollController,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 16.h,
          childAspectRatio: 0.8,
        ),
        itemCount: _visibleItems.length + 1,
        itemBuilder: (context, index) {
          if (index >= _visibleItems.length) {
            return _showAll
                ? SizedBox.expand(child: Center(child: buildBackToTopButton()))
                : buildLoadMoreButton();
          }
          return buildGridItem(_visibleItems[index]);
        },
      ),
    );
  }

  Widget buildLoadMoreButton() {
    return InkWell(
      borderRadius: BorderRadius.circular(15.r),
      onTap: _allItems.isNotEmpty ? _loadAllItems : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 16.h),
          Image.asset(AppAssets.addmore),
          SizedBox(height: 7.h),
          Container(
            width: 100,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'view_more'.tr(),
                style: TextStyle(
                  fontSize: 9.sp,
                  color: _allItems.isNotEmpty
                      ? AppColors.mainAppColor
                      : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBackToTopButton() {
    return InkWell(
      borderRadius: BorderRadius.circular(15.r),
      onTap: _loadInitialItems,
      child: Column(
        children: [
          Icon(
            Icons.arrow_upward,
            color: AppColors.mainAppColor,
            size: 24.w,
          ),
          SizedBox(height: 8.h),
          Text(
            'العودة للأعلى',
            style: TextStyle(
              fontSize: 10.sp,
              color: AppColors.mainAppColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGridItem(Map<String, String> item) {
    return InkWell(
      borderRadius: BorderRadius.circular(15.r),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) =>const ContentProduct()));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            item['image']!,
            width: 89,
            height: 89,
            fit: BoxFit.contain,
          ),
          Container(
            width: 170,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Text(
                  item['title']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mainAppColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
