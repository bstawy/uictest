import 'package:flutter/material.dart';

extension NavigatorHelper on BuildContext {
  Future<void> push(Widget widget) {
    return Navigator.of(this).push(
      MaterialPageRoute(builder: (ctx0) => widget),
    );
  }

  Future<void> pushReplacement(Widget widget) {
    return Navigator.of(this).pushReplacement(
      MaterialPageRoute(builder: (ctx1) => widget),
    );
  }

  Future<void> pushAndRemoveUntil(Widget widget) {
    return Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx2) => widget),
      (Route<dynamic> route) => false,
    );
  }

  void pop() => Navigator.of(this).pop();

  Future<dynamic> pushAnimated(Widget widget) {
    return Navigator.of(this).push(
      PageRouteBuilder(
        pageBuilder: (ctx3, animation, secondaryAnimation) => widget,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const double begin = 0.0;
          const double end = 1.0;
          const curve = Curves.easeInOut;
          var tween = Tween<double>(begin: begin, end: end)
              .chain(CurveTween(curve: curve));
          return FadeTransition(
            opacity: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  Future<dynamic> pushReplacementAnimated(Widget widget) {
    return Navigator.of(this).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(
          seconds: 1,
        ),
        pageBuilder: (ctx4, animation, secondaryAnimation) => widget,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const double begin = 0.0;
          const double end = 1.0;
          const curve = Curves.easeInOut;
          var tween = Tween<double>(begin: begin, end: end)
              .chain(CurveTween(curve: curve));
          return FadeTransition(
            opacity: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  void popAnimated(Widget widget) {
    Navigator.of(this).pop(
      PageRouteBuilder(
        pageBuilder: (ctx5, animation, secondaryAnimation) => widget,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const double begin = 0.0;
          const double end = 1.0;
          const curve = Curves.easeInOut;
          var tween = Tween<double>(begin: begin, end: end)
              .chain(CurveTween(curve: curve));
          return FadeTransition(
            opacity: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }
}
