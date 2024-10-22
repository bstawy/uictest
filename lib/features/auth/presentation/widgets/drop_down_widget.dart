import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/theme_ext.dart';

class DropDownWidget extends StatefulWidget {
  final List<String> items;
  final String? hint;
  final void Function(int)? onChanged;

  const DropDownWidget({
    super.key,
    required this.items,
    required this.hint,
    this.onChanged,
  });

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  dynamic selectedValue;

  @override
  Widget build(BuildContext context) {
    final kColors = context.colors;

    return DropdownButtonFormField(
      items: widget.items
          .map(
            (item) => DropdownMenuItem(
              value: item,
              child: Text(item.toString()),
            ),
          )
          .toList(),
      onChanged: (value) {
        widget.onChanged?.call(widget.items.indexOf(value.toString()));
        setState(() {
          selectedValue = value!;
        });
      },
      value: selectedValue,
      decoration: InputDecoration(
        labelText: widget.hint,
        hintText: widget.hint,
        hintMaxLines: 1,
        alignLabelWithHint: true,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 18.h,
        ),
        hintStyle: TextStyle(
          color: kColors.onSurface,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: kColors.primary,
            width: 1.3,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: kColors.primary,
            width: 1.3,
          ),
        ),
      ),
    );
  }
}
