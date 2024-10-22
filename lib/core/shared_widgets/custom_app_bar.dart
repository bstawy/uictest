import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app_config_cubit/app_config_cubit.dart';
import '../extensions/navigation_ext.dart';
import '../theme/custom_colors.dart';
import '../theme/custom_text_styles.dart';
import '../utils/assets_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    super.key,
    this.title,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    final String appBarBackgroundImage =
        context.read<AppConfigCubit>().themeIsDark
            ? AssetsManager.appBarBackgroundDarkImage
            : AssetsManager.appBarBackgroundImage;

    return Container(
      height: kToolbarHeight + 75.h,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        top: 24.h,
        left: 24.w,
        right: 24.w,
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
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: onBackPressed ?? () => context.pop(),
            borderRadius: BorderRadius.circular(8.r),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  width: 36.w,
                  height: 36.h,
                  padding: EdgeInsets.all(4.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: CustomColors.lightPurple,
                      width: 1,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: context.read<AppConfigCubit>().themeIsDark
                          ? [
                              const Color(0xff26233A).withOpacity(0.4),
                              const Color(0xff161421).withOpacity(0.4),
                            ]
                          : [
                              Colors.white.withOpacity(0.5),
                              Colors.white.withOpacity(0.35),
                            ],
                    ),
                  ),
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    AssetsManager.appBarBackIcon,
                    height: 12.h,
                    width: 12.w,
                    //
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          TextHelpers.mediumText(
            text: title ?? "",
            fontSize: 18,
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          const SizedBox(width: 40),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 75.h);
}
