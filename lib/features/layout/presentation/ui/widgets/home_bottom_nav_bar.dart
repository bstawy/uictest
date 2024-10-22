import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/shared_widgets/frosted_effect_widget.dart';
import '../../../../../core/theme/custom_colors.dart';
import '../../../../../core/theme/custom_text_styles.dart';
import '../../../../../core/utils/assets_manager.dart';

class CustomBottomNavBar extends StatefulWidget {
  final PageController pageController;

  const CustomBottomNavBar({
    super.key,
    required this.pageController,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int currentIndex = 0;

  void _switchTab(int index) {
    setState(() {
      currentIndex = index;
      // widget.pageController.jumpToPage(index);
      widget.pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      debugPrint("Current Index: ${widget.pageController.page}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return FrostedEffect(
      child: Container(
        height: 92.h,
        margin: EdgeInsets.only(
          top: 4.h,
          bottom: 20.0.h,
          left: 12.0.w,
          right: 12.0.w,
        ),
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: const Color(0xFF3F3A60).withOpacity(0.4),
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(
            color: CustomColors.lightPurple,
            width: 1.0.w,
          ),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BottomNavBarItem(
              title: 'Home',
              iconPath: AssetsManager.homeIcon,
              isSelected: currentIndex == 0,
              onTap: () {
                _switchTab(0);
              },
            ),
            BottomNavBarItem(
              title: 'Policies',
              iconPath: AssetsManager.policiesIcon,
              isSelected: currentIndex == 1,
              onTap: () {
                _switchTab(1);
              },
            ),
            BottomNavBarItem(
              title: 'Vehicles',
              iconPath: AssetsManager.vehiclesIcon,
              isSelected: currentIndex == 2,
              onTap: () {
                _switchTab(2);
              },
            ),
            BottomNavBarItem(
              title: 'Support',
              iconPath: AssetsManager.supportIcon,
              isSelected: currentIndex == 3,
              onTap: () {
                _switchTab(3);
              },
            ),
            BottomNavBarItem(
              title: 'Profile',
              iconPath: AssetsManager.profileIcon,
              isSelected: currentIndex == 4,
              onTap: () {
                _switchTab(4);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavBarItem extends StatelessWidget {
  final String title;
  final String iconPath;
  final bool isSelected;
  final VoidCallback onTap;

  const BottomNavBarItem({
    super.key,
    required this.title,
    required this.iconPath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40.h,
            width: 40.w,
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
              color: isSelected ? CustomColors.purple : Colors.transparent,
            ),
            child: SvgPicture.asset(iconPath),
          ),
          Gap(4.h),
          TextHelpers.regularText(
            text: title,
            fontSize: 10,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
