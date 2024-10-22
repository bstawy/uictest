import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../core/shared_widgets/gradient_elevated_button.dart';
import 'widgets/onboarding_app_bar.dart';
import 'widgets/onboarding_model.dart';
import 'widgets/onboarding_stepper_widget.dart';
import 'widgets/onboarding_widget.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  late final PageController _pageController;
  int currentPageIndex = 0;
  String buttonText = 'Get Started';

  late List<OnboardingModel> _onboardingList;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPageIndex);

    _onboardingList = [
      OnboardingModel(
        title: 'Welcome',
        descriptionTitle: 'Welcome\nto United Insurance',
        descriptionBody: 'The best way to manage your insurance needs.',
        imagePath: '',
        currentStep: 0,
      ),
      OnboardingModel(
        title: 'Buy Policy',
        descriptionTitle: 'Get insured quickly',
        descriptionBody: 'Choose your coverage and vehicle to get started.',
        imagePath: '',
        currentStep: 1,
      ),
      OnboardingModel(
        title: 'Policies',
        descriptionTitle: 'Manage your insurance with ease',
        descriptionBody:
            'Easily view and manage all your active and expired insurance policies.',
        imagePath: '',
        currentStep: 2,
      ),
      OnboardingModel(
        title: 'Claims',
        descriptionTitle: 'Streamline your claims process',
        descriptionBody:
            'Submit and track your insurance claims quickly and efficiently.',
        imagePath: '',
        currentStep: 3,
      ),
      OnboardingModel(
        title: 'Vehicles',
        descriptionTitle: 'Your vehicles, covered and controlled',
        descriptionBody: 'Add, edit and view details of your insured vehicles.',
        imagePath: '',
        currentStep: 4,
      ),
      OnboardingModel(
        title: 'Help center',
        descriptionTitle: 'Get the help you need, anytime',
        descriptionBody:
            'Access our support center for any help or assistance you need.',
        imagePath: '',
        currentStep: 5,
      ),
      OnboardingModel(
        title: 'Get started',
        descriptionTitle: 'Begin your journey to access all features',
        descriptionBody:
            'Ready to Get Started? Log in or sign up to access all features.',
        imagePath: '',
        currentStep: 6,
      ),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OnboardingAppBar(),
      body: Column(
        children: [
          Gap(20.h),
          OnboardingStepperWidget(currentStep: currentPageIndex),
          Gap(8.h),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  currentPageIndex = value;
                  buttonText =
                      (value == 0 || value == _onboardingList.length - 1)
                          ? 'Get Started'
                          : 'Next';
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
              // Navigate to login
              return;
            }
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          title: buttonText,
        ),
      ),
    );
  }
}
