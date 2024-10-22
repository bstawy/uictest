import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FrostedEffect extends StatelessWidget {
  final Widget child;
  final double? borderRadius, sigmaX, sigmaY;

  const FrostedEffect({
    super.key,
    required this.child,
    this.borderRadius,
    this.sigmaX,
    this.sigmaY,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 15.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: sigmaX ?? 2,
          sigmaY: sigmaY ?? 2,
        ),
        child: child,
      ),
    );
  }
}
