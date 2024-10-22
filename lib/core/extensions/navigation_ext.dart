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

  Future<void> pushAndRemoveUntil(Widget nextWidget, {Widget? rootWidget}) {
    return Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx2) => widget),
      (Route<dynamic> route) {
        return rootWidget == null
            ? false
            : route.settings.name == rootWidget.runtimeType.toString();
      },
    );
  }

  void pop() => Navigator.of(this).pop();

  Future<dynamic> pushAnimated(Widget widget) {
    return Navigator.of(this).push(_createAnimatedRoute(widget));
  }

  Future<dynamic> pushReplacementAnimated(Widget widget) {
    return Navigator.of(this).pushReplacement(_createAnimatedRoute(widget));
  }

  Future<dynamic> pushAndRemoveUntilAnimated(Widget nextWidget,
      {Widget? rootWidget}) {
    return Navigator.of(this).pushAndRemoveUntil(
      _createAnimatedRoute(widget),
      (Route<dynamic> route) {
        if (rootWidget == null) {
          return false;
        } else {
          return route.settings.name == rootWidget.runtimeType.toString();
        }
      },
    );
  }

  void popAnimated(Widget widget) {
    Navigator.of(this).pop(_createAnimatedRoute(widget));
  }

  PageRouteBuilder _createAnimatedRoute(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (ctx, animation, secondaryAnimation) => widget,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
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
    );
  }
}
