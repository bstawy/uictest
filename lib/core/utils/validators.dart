import '../../main.dart';
import 'get_configs.dart';

class Validators {
  static String? validateNotEmpty({String? title, String? value}) {
    final isArabic = GetConfigs.isArabicLanguage(navKey.currentState!.context);

    if (_isEmpty(value)) {
      return (isArabic ? "يجب إدخال $title" : "$title is required");
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final isArabic = GetConfigs.isArabicLanguage(navKey.currentState!.context);

    if (_isEmpty(value)) {
      return (isArabic ? "يجب إدخال البريد الإلكتروني" : "Email is required");
    }

    var regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!regex.hasMatch(value!)) {
      return isArabic ? "البريد الإلكتروني غير صالح" : "Invalid email address";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    final isArabic = GetConfigs.isArabicLanguage(navKey.currentState!.context);

    if (_isEmpty(value)) {
      return isArabic ? "يجب إدخال كلمة السر" : "Password is required";
    }

    if (value!.trim().length < 8) {
      return isArabic
          ? "كلمة السر يجب ان تكون على الأقل 8 أحرف\nيجب أن تحتوي على A-Z, a-z, @-#-&.. , 1-9"
          : "Password must be At least 8 characters\nMust contains A-Z, a-z, @-#-&.. , 1-9";
    }

    var regex = RegExp(
        r"(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.\\n])(?=.*[A-Z])(?=.*[a-z])(?=.*\d).*$");

    if (!regex.hasMatch(value)) {
      return isArabic
          ? "يجب أن تحتوي على A-Z, a-z, @-#-&.. , 1-9"
          : "Must contains A-Z, a-z, @-#-&.. , 1-9";
    }

    return null;
  }

  static String? validatePasswordConfirmation(
      {String? password, String? confirmPassword}) {
    final isArabic = GetConfigs.isArabicLanguage(navKey.currentState!.context);

    if (_isEmpty(password)) {
      return isArabic ? "يجب إدخال كلمة السر" : "Password is required";
    }
    if (_isEmpty(confirmPassword)) {
      return isArabic
          ? "يجب إدخال تأكيد كلمة السر"
          : "Confirm password is required";
    }

    if (password != confirmPassword) {
      return isArabic ? "كلمة السر غير متطابقة" : "Passwords does not match";
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    final isArabic = GetConfigs.isArabicLanguage(navKey.currentState!.context);

    if (_isEmpty(value)) {
      return isArabic ? "يجب إدخال رقم الهاتف" : 'Phone Number is required';
    }

// Validation for egyptian numbers only
//     var regex = RegExp(
//       r"^(?:\+20|0)?1[0125]\d{8}$",
//     );

//     if (!regex.hasMatch(value!)) {
//       return """Must be 11 digits starts with (+20) or 0
// Prefix is 10, 11, 12 or 15 only""";
//     }

    return null;
  }

  static bool _isEmpty(String? value) {
    return value == null || value.trim().isEmpty;
  }

  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }
}
