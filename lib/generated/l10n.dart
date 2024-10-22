// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Arabic`
  String get ar {
    return Intl.message(
      'Arabic',
      name: 'ar',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get en {
    return Intl.message(
      'English',
      name: 'en',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Got it`
  String get got_it {
    return Intl.message(
      'Got it',
      name: 'got_it',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Get started`
  String get get_started {
    return Intl.message(
      'Get started',
      name: 'get_started',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get previous {
    return Intl.message(
      'Previous',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Welcome\nto United Insurance`
  String get welcome_united_insurance {
    return Intl.message(
      'Welcome\nto United Insurance',
      name: 'welcome_united_insurance',
      desc: '',
      args: [],
    );
  }

  /// `The best way to manage your insurance needs.`
  String get manage_insurance_needs {
    return Intl.message(
      'The best way to manage your insurance needs.',
      name: 'manage_insurance_needs',
      desc: '',
      args: [],
    );
  }

  /// `Buy Policy`
  String get buy_policy {
    return Intl.message(
      'Buy Policy',
      name: 'buy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Get insured quickly`
  String get get_insured_quickly {
    return Intl.message(
      'Get insured quickly',
      name: 'get_insured_quickly',
      desc: '',
      args: [],
    );
  }

  /// `Choose your coverage and vehicle to get started.`
  String get choose_coverage_vehicle {
    return Intl.message(
      'Choose your coverage and vehicle to get started.',
      name: 'choose_coverage_vehicle',
      desc: '',
      args: [],
    );
  }

  /// `Policies`
  String get policies {
    return Intl.message(
      'Policies',
      name: 'policies',
      desc: '',
      args: [],
    );
  }

  /// `Manage your insurance with ease`
  String get manage_insurance_ease {
    return Intl.message(
      'Manage your insurance with ease',
      name: 'manage_insurance_ease',
      desc: '',
      args: [],
    );
  }

  /// `Easily view and manage all your active and expired insurance policies.`
  String get view_manage_policies {
    return Intl.message(
      'Easily view and manage all your active and expired insurance policies.',
      name: 'view_manage_policies',
      desc: '',
      args: [],
    );
  }

  /// `Claims`
  String get claims {
    return Intl.message(
      'Claims',
      name: 'claims',
      desc: '',
      args: [],
    );
  }

  /// `Streamline your claims process`
  String get streamline_claims {
    return Intl.message(
      'Streamline your claims process',
      name: 'streamline_claims',
      desc: '',
      args: [],
    );
  }

  /// `Submit and track your insurance claims quickly and efficiently.`
  String get submit_track_claims {
    return Intl.message(
      'Submit and track your insurance claims quickly and efficiently.',
      name: 'submit_track_claims',
      desc: '',
      args: [],
    );
  }

  /// `Vehicles`
  String get vehicles {
    return Intl.message(
      'Vehicles',
      name: 'vehicles',
      desc: '',
      args: [],
    );
  }

  /// `Your vehicles, covered and controlled`
  String get covered_controlled_vehicles {
    return Intl.message(
      'Your vehicles, covered and controlled',
      name: 'covered_controlled_vehicles',
      desc: '',
      args: [],
    );
  }

  /// `Add, edit and view details of your insured vehicles.`
  String get add_edit_view_vehicles {
    return Intl.message(
      'Add, edit and view details of your insured vehicles.',
      name: 'add_edit_view_vehicles',
      desc: '',
      args: [],
    );
  }

  /// `Help center`
  String get help_center {
    return Intl.message(
      'Help center',
      name: 'help_center',
      desc: '',
      args: [],
    );
  }

  /// `Get the help you need, anytime`
  String get get_help_anytime {
    return Intl.message(
      'Get the help you need, anytime',
      name: 'get_help_anytime',
      desc: '',
      args: [],
    );
  }

  /// `Access our support center for any help or assistance you need.`
  String get access_support_center {
    return Intl.message(
      'Access our support center for any help or assistance you need.',
      name: 'access_support_center',
      desc: '',
      args: [],
    );
  }

  /// `Begin your journey to access all features`
  String get begin_journey_features {
    return Intl.message(
      'Begin your journey to access all features',
      name: 'begin_journey_features',
      desc: '',
      args: [],
    );
  }

  /// `Ready to Get Started? Log in or sign up to access all features.`
  String get ready_get_started {
    return Intl.message(
      'Ready to Get Started? Log in or sign up to access all features.',
      name: 'ready_get_started',
      desc: '',
      args: [],
    );
  }

  /// `Guest`
  String get guest {
    return Intl.message(
      'Guest',
      name: 'guest',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get remember_me {
    return Intl.message(
      'Remember me',
      name: 'remember_me',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get forgot_password {
    return Intl.message(
      'Forgot password',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Or login with`
  String get or_login_with {
    return Intl.message(
      'Or login with',
      name: 'or_login_with',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get continue_with_google {
    return Intl.message(
      'Continue with Google',
      name: 'continue_with_google',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Apple`
  String get continue_with_apple {
    return Intl.message(
      'Continue with Apple',
      name: 'continue_with_apple',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Facebook`
  String get continue_with_facebook {
    return Intl.message(
      'Continue with Facebook',
      name: 'continue_with_facebook',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account ?`
  String get dont_have_account {
    return Intl.message(
      'Don\'t have an account ?',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get sign_up {
    return Intl.message(
      'Sign up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `ID and Contact Details`
  String get id_and_contact_details {
    return Intl.message(
      'ID and Contact Details',
      name: 'id_and_contact_details',
      desc: '',
      args: [],
    );
  }

  /// `ID Number`
  String get id_number {
    return Intl.message(
      'ID Number',
      name: 'id_number',
      desc: '',
      args: [],
    );
  }

  /// `Select country`
  String get select_country {
    return Intl.message(
      'Select country',
      name: 'select_country',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `OTP Verification`
  String get otp_verification {
    return Intl.message(
      'OTP Verification',
      name: 'otp_verification',
      desc: '',
      args: [],
    );
  }

  /// `Enter the OTP sent to your phone`
  String get enter_otp_sent_to_phone {
    return Intl.message(
      'Enter the OTP sent to your phone',
      name: 'enter_otp_sent_to_phone',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive the OTP?`
  String get didnt_receive_otp {
    return Intl.message(
      'Didn\'t receive the OTP?',
      name: 'didnt_receive_otp',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get resend_code {
    return Intl.message(
      'Resend Code',
      name: 'resend_code',
      desc: '',
      args: [],
    );
  }

  /// `Personal Details`
  String get personal_details {
    return Intl.message(
      'Personal Details',
      name: 'personal_details',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get first_name {
    return Intl.message(
      'First Name',
      name: 'first_name',
      desc: '',
      args: [],
    );
  }

  /// `Middle Name`
  String get middle_name {
    return Intl.message(
      'Middle Name',
      name: 'middle_name',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get last_name {
    return Intl.message(
      'Last Name',
      name: 'last_name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Nationality`
  String get nationality {
    return Intl.message(
      'Nationality',
      name: 'nationality',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Security Informations`
  String get security_informations {
    return Intl.message(
      'Security Informations',
      name: 'security_informations',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Touch ID`
  String get touch_id {
    return Intl.message(
      'Touch ID',
      name: 'touch_id',
      desc: '',
      args: [],
    );
  }

  /// `Enabling Touch ID will give you faster access to your information`
  String get touch_id_enabling_message {
    return Intl.message(
      'Enabling Touch ID will give you faster access to your information',
      name: 'touch_id_enabling_message',
      desc: '',
      args: [],
    );
  }

  /// `You can turn this feature on or off at any time under Settings.`
  String get enable_from_settings_message {
    return Intl.message(
      'You can turn this feature on or off at any time under Settings.',
      name: 'enable_from_settings_message',
      desc: '',
      args: [],
    );
  }

  /// `Not Now`
  String get not_now {
    return Intl.message(
      'Not Now',
      name: 'not_now',
      desc: '',
      args: [],
    );
  }

  /// `Enable`
  String get enable {
    return Intl.message(
      'Enable',
      name: 'enable',
      desc: '',
      args: [],
    );
  }

  /// `Biometric authentication is not available on this device.`
  String get biometric_not_available {
    return Intl.message(
      'Biometric authentication is not available on this device.',
      name: 'biometric_not_available',
      desc: '',
      args: [],
    );
  }

  /// `No biometric credentials are enrolled on this device.`
  String get no_biometric_credentials {
    return Intl.message(
      'No biometric credentials are enrolled on this device.',
      name: 'no_biometric_credentials',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error occurred. Please try again.`
  String get unknown_error_occurred {
    return Intl.message(
      'An unknown error occurred. Please try again.',
      name: 'unknown_error_occurred',
      desc: '',
      args: [],
    );
  }

  /// `Face ID`
  String get face_id {
    return Intl.message(
      'Face ID',
      name: 'face_id',
      desc: '',
      args: [],
    );
  }

  /// `Enabling Face ID will give you faster access to your information`
  String get face_id_enabling_message {
    return Intl.message(
      'Enabling Face ID will give you faster access to your information',
      name: 'face_id_enabling_message',
      desc: '',
      args: [],
    );
  }

  /// `Select your nationality`
  String get select_your_nationality {
    return Intl.message(
      'Select your nationality',
      name: 'select_your_nationality',
      desc: '',
      args: [],
    );
  }

  /// `Select your gender`
  String get select_your_gender {
    return Intl.message(
      'Select your gender',
      name: 'select_your_gender',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
