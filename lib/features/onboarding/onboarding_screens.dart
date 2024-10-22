import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../core/extensions/navigation_ext.dart';
import '../../core/services_locator/services_locator.dart';
import '../../core/shared_widgets/custom_stepper_widget.dart';
import '../../core/shared_widgets/gradient_elevated_button.dart';
import '../../core/shared_widgets/patterned_scaffold.dart';
import '../../core/utils/assets_manager.dart';
import '../../generated/l10n.dart';
import '../auth/presentation/login/cubit/login_cubit.dart';
import '../auth/presentation/login/ui/login_screen.dart';
import 'widgets/onboarding_app_bar.dart';
import 'widgets/onboarding_model.dart';
import 'widgets/onboarding_widget.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  late final PageController _pageController;
  int currentPageIndex = 0;

  List<OnboardingModel> _onboardingList = [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _fillOnboardingList(S locale) {
    _onboardingList.clear();
    _onboardingList = [
      OnboardingModel(
        id: 0,
        titleLocaleKey: locale.welcome,
        descriptionTitleLocaleKey: locale.welcome_united_insurance,
        descriptionBodyLocaleKey: locale.manage_insurance_needs,
        imagePath: AssetsManager.uicFullLogo,
        darkImagePath: AssetsManager.uicFullLogoDark,
        currentStep: 0,
      ),
      OnboardingModel(
        id: 1,
        titleLocaleKey: locale.buy_policy,
        descriptionTitleLocaleKey: locale.get_insured_quickly,
        descriptionBodyLocaleKey: locale.choose_coverage_vehicle,
        imagePath: AssetsManager.onboardingImage01,
        darkImagePath: AssetsManager.onboardingImageDark01,
        currentStep: 1,
      ),
      OnboardingModel(
        id: 2,
        titleLocaleKey: locale.policies,
        descriptionTitleLocaleKey: locale.manage_insurance_ease,
        descriptionBodyLocaleKey: locale.view_manage_policies,
        imagePath: AssetsManager.onboardingImage02,
        darkImagePath: AssetsManager.onboardingImageDark02,
        currentStep: 2,
      ),
      OnboardingModel(
        id: 3,
        titleLocaleKey: locale.claims,
        descriptionTitleLocaleKey: locale.streamline_claims,
        descriptionBodyLocaleKey: locale.submit_track_claims,
        imagePath: AssetsManager.onboardingImage03,
        darkImagePath: AssetsManager.onboardingImageDark03,
        currentStep: 3,
      ),
      OnboardingModel(
        id: 4,
        titleLocaleKey: locale.vehicles,
        descriptionTitleLocaleKey: locale.covered_controlled_vehicles,
        descriptionBodyLocaleKey: locale.add_edit_view_vehicles,
        imagePath: AssetsManager.onboardingImage04,
        darkImagePath: AssetsManager.onboardingImageDark04,
        currentStep: 4,
      ),
      OnboardingModel(
        id: 5,
        titleLocaleKey: locale.help_center,
        descriptionTitleLocaleKey: locale.get_help_anytime,
        descriptionBodyLocaleKey: locale.access_support_center,
        imagePath: AssetsManager.onboardingImage05,
        darkImagePath: AssetsManager.onboardingImageDark05,
        currentStep: 5,
      ),
      OnboardingModel(
        id: 6,
        titleLocaleKey: locale.get_started,
        descriptionTitleLocaleKey: locale.begin_journey_features,
        descriptionBodyLocaleKey: locale.ready_get_started,
        imagePath: AssetsManager.onboardingImage06,
        darkImagePath: AssetsManager.onboardingImageDark06,
        currentStep: 6,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    _fillOnboardingList(locale);
    return PatternedScaffold(
      appBar: const OnboardingAppBar(),
      body: Column(
        children: [
          Gap(20.h),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
            child: CustomStepperWidget(
              stepsNumber: 7,
              currentStep: currentPageIndex,
              stepHeight: 5.h,
            ),
          ),
          Gap(8.h),
          Flexible(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (value) {
                setState(() {
                  currentPageIndex = value;
                });
              },
              children: _onboardingList
                  .map(
                    (onBoarding) => OnboardingWidget(
                      pageController: _pageController,
                      onboardingModel: onBoarding,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          top: 16.h,
          bottom: 40.0.h,
          left: 16.0.w,
          right: 16.0.w,
        ),
        child: GradientElevatedButton(
          onPressed: () {
            if (currentPageIndex == _onboardingList.length - 1) {
              context.pushReplacementAnimated(
                BlocProvider<LoginCubit>(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginScreen(),
                ),
              );
              return;
            }
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          title: currentPageIndex == 0 ? locale.get_started : locale.next,
        ),
      ),
    );
  }
}
