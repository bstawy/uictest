import 'dart:developer';

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/extensions/theme_ext.dart';
import '../../../../core/shared_widgets/custom_input_field.dart';
import '../../../../core/utils/validators.dart';
import '../../../../generated/l10n.dart';

class PhoneInputField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String?)? onInputChanged;
  final Function(String)? onSelectCode;

  const PhoneInputField({
    super.key,
    required this.controller,
    this.onInputChanged,
    this.onSelectCode,
  });

  @override
  State<PhoneInputField> createState() => _PhoneInputFieldState();
}

class _PhoneInputFieldState extends State<PhoneInputField> {
  Country _selectedCountry = Country(
    isoCode: 'SA',
    iso3Code: 'SAU',
    phoneCode: '966',
    name: 'Saudi Arabia',
  );

  void _openCountryPickerDialog() {
    showDialog(
        context: context,
        builder: (context) {
          final locale = S.of(context);
          return Theme(
            data: Theme.of(context),
            child: CountryPickerDialog(
              title: Text(locale.select_country),
              titlePadding: EdgeInsets.all(4.0.r),
              searchCursorColor: Theme.of(context).primaryColor,
              searchInputDecoration:
                  InputDecoration(hintText: '${locale.search}...'),
              isSearchable: true,
              onValuePicked: (Country country) {
                if (kDebugMode) {
                  log(country.isoCode, name: 'isoCode');
                  log(country.iso3Code, name: 'iso3Code');
                  log(country.phoneCode, name: 'phoneCode');
                  log(country.name, name: 'name');
                }
                widget.onSelectCode?.call(country.phoneCode);
                setState(() => _selectedCountry = country);
              },
              priorityList: [
                CountryPickerUtils.getCountryByIsoCode('SA'),
                CountryPickerUtils.getCountryByIsoCode('BH'),
              ],
              itemBuilder: (country) {
                return _buildDialogItem(country, false);
              },
            ),
          );
        });
  }

  Widget _buildDialogItem(Country country, bool isSelected) {
    return Row(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(50.r),
          child: SizedBox(
            width: 25.w,
            height: 25.h,
            child: CountryPickerUtils.getDefaultFlagImage(country),
          ),
        ),
        Gap(isSelected ? 4.0.w : 8.w),
        Text("+${country.phoneCode}"),
        Gap(isSelected ? 4.0.w : 8.w),
        isSelected
            ? const Icon(Icons.keyboard_arrow_down_rounded)
            : Flexible(child: Text(country.name)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final kColors = context.colors;
    final locale = S.of(context);

    return CustomInputField(
      controller: widget.controller,
      hint: locale.phone_number,
      label: locale.phone_number,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      validator: Validators.validatePhoneNumber,
      keyboardType: TextInputType.phone,
      onChanged: widget.onInputChanged,
      isFilled: true,
      backgroundColor: kColors.surfaceContainerHighest,
      prefixIcon: GestureDetector(
        onTap: () => _openCountryPickerDialog(),
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            start: 16.w,
            end: 4.w,
          ),
          child: IntrinsicWidth(
            child: _buildDialogItem(_selectedCountry, true),
          ),
        ),
      ),
    );
  }
}
