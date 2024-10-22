import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../app_config_cubit/app_config_cubit.dart';
import '../../../../../core/extensions/theme_ext.dart';
import '../../../../../core/shared_widgets/frosted_effect_widget.dart';
import '../../../../../core/theme/custom_text_styles.dart';
import '../../../../../core/utils/assets_manager.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onBackPressed;

  const HomeAppBar({
    super.key,
    this.title,
    this.onBackPressed,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 261.h);

  @override
  Widget build(BuildContext context) {
    final kColors = context.colors;

    final String appBarBackgroundImage =
        context.read<AppConfigCubit>().themeIsDark
            ? AssetsManager.homeAppBarDarkImage
            : AssetsManager.homeAppBarImage;

    return Container(
      height: kToolbarHeight + 261.h,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        top: 45.h,
        left: 18.w,
        right: 18.w,
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(appBarBackgroundImage),
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
          // color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.r),
            bottomRight: Radius.circular(30.r),
          ),
          boxShadow: context.read<AppConfigCubit>().themeIsDark
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 12,
                    blurStyle: BlurStyle.outer,
                    offset: const Offset(0, 12),
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.35),
                    blurRadius: 4,
                    blurStyle: BlurStyle.outer,
                    offset: const Offset(0, 4),
                  ),
                  BoxShadow(
                    color: const Color(0xff86819B).withOpacity(0.15),
                    blurRadius: 12,
                    blurStyle: BlurStyle.inner,
                    offset: const Offset(0, 0),
                  ),
                ]
              : null),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 12.h),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.r),
                      child: Image.asset(
                        'assets/images/profile_pic.jpeg',
                        width: 48.w,
                        height: 48.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Gap(16.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextHelpers.regularText(
                          text: 'Hello,',
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.5),
                        ),
                        TextHelpers.mediumText(
                          text: 'Ahmed Al-Saud',
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 9.h, end: 16.w),
                  child: GestureDetector(
                    onTap: () => context.read<AppConfigCubit>().changeTheme(),
                    child: SvgPicture.asset(
                      AssetsManager.notificationsIcon,
                      width: 30.w,
                      height: 30.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 13.h),
                child: FrostedEffect(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: const Color(0xFF605A88),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.25),
                        width: 0.5,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextHelpers.mediumText(
                                  text: 'KSA',
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                                TextHelpers.regularText(
                                  text: 'Saudi Arabia',
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            SvgPicture.asset(
                              AssetsManager.switchArrowsIcon,
                              width: 24.w,
                              height: 24.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextHelpers.mediumText(
                                  text: 'BHR',
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                                TextHelpers.regularText(
                                  text: 'Bahrain',
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          child: Container(
                            height: 2.h,
                            decoration: BoxDecoration(
                              color: const Color(0xff26233A),
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            alignment: AlignmentDirectional.centerStart,
                            child: Container(
                              height: 2.h,
                              width: 0.7.sw,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0.h,
                right: 14.w,
                child: FrostedEffect(
                  borderRadius: 50.r,
                  child: Container(
                    // height: 12.h,
                    // width: 12.w,
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      color: const Color(0xff494949).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(50.r),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.25),
                        width: 0.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
                          child: TextHelpers.regularText(
                            text: "1 hour 14 mins",
                            fontSize: 8,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: const Color(0xffDDFFD8).withOpacity(0.9),
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: TextHelpers.regularText(
                            text: "No crowded",
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
