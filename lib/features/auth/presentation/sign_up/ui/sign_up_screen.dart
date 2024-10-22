import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/extensions/navigation_ext.dart';
import '../../../../../core/extensions/theme_ext.dart';
import '../../../../../core/shared_widgets/custom_app_bar.dart';
import '../../../../../core/shared_widgets/custom_stepper_widget.dart';
import '../../../../../core/shared_widgets/gradient_elevated_button.dart';
import '../../../../../core/shared_widgets/patterned_scaffold.dart';
import '../../../../../generated/l10n.dart';
import '../cubit/sign_up_cubit.dart';
import 'pages/sign_up_contact_details.dart';
import 'pages/sign_up_listener.dart';
import 'pages/sign_up_otp_verification.dart';
import 'pages/sign_up_personal_details.dart';
import 'pages/sign_up_security_informations.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final PageController _pageController;
  int currentPageIndex = 0;
  String buttonText = 'Next';

  final List<Widget> _signUpPages = [
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: const SignUpContactDetails(),
    ),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: const SignUpOtpVerification(),
    ),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: const SignUpPersonalDetails(),
    ),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: const SignUpSecurityInformations(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = context.read<SignUpCubit>().signUpPageController;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _pageChanged(int index) {
    setState(() {
      currentPageIndex = index;
      if (currentPageIndex == _signUpPages.length - 1) {
        buttonText = 'Sign Up';
      } else {
        buttonText = 'Next';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final kColors = context.colors;
    final locale = S.of(context);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          if (currentPageIndex != 0) {
            _previousPage();
          } else {
            context.pop();
          }
        }
      },
      child: PatternedScaffold(
        appBar: CustomAppBar(
          title: locale.sign_up,
          onBackPressed: currentPageIndex != 0 ? _previousPage : null,
        ),
        body: SafeArea(
          child: Column(
            children: [
              const SignUpListener(),
              Gap(16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CustomStepperWidget(
                  stepsNumber: 4,
                  currentStep: currentPageIndex,
                  unfinishedStepColor: kColors.onPrimaryContainer,
                ),
              ),
              Gap(14.h),
              Flexible(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (value) => _pageChanged(value),
                  physics: const NeverScrollableScrollPhysics(),
                  children: _signUpPages,
                ),
              ),
            ],
          ),
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
              switch (currentPageIndex) {
                case 0:
                  context.read<SignUpCubit>().validateSignUpContactDetails();
                case 1:
                  context.read<SignUpCubit>().validateSignUpOtpVerification();
                case 2:
                  context.read<SignUpCubit>().validateSignUpPersonalDetails();
                case 3:
                  context
                      .read<SignUpCubit>()
                      .validateSignUpSecurityInformations();
                default:
              }
            },
            title: currentPageIndex == _signUpPages.length - 1
                ? locale.sign_up
                : locale.next,
          ),
        ),
      ),
    );
  }
}
