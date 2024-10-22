import 'dart:developer';

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/extensions/theme_ext.dart';
import '../../../../core/shared_widgets/custom_input_field.dart';
import '../../../../core/theme/custom_text_styles.dart';
import '../../../../core/utils/validators.dart';
import '../../../../generated/l10n.dart';
import '../sign_up/cubit/sign_up_cubit.dart';

class NationalityDropDown extends StatefulWidget {
  final Function(String)? onChanged;

  const NationalityDropDown({super.key, this.onChanged});

  @override
  State<NationalityDropDown> createState() => _NationalityDropDownState();
}

class _NationalityDropDownState extends State<NationalityDropDown> {
  Country? _selectedCountry;
  late final TextEditingController _nationalityController;

  @override
  void initState() {
    super.initState();
    _nationalityController = TextEditingController(
      text: context.read<SignUpCubit>().signUpRequestModel.nationality ?? '',
    );
  }

  @override
  void dispose() {
    _nationalityController.dispose();
    super.dispose();
  }

  void _openCountryPickerDialog(final SignUpCubit signUpCubit) {
    showDialog(
      context: context,
      builder: (context) {
        final locale = S.of(context);
        final kColors = context.colors;

        return Theme(
          data: Theme.of(context),
          child: CountryPickerDialog(
            contentPadding: EdgeInsets.only(top: 16.h, left: 4.w, right: 4.w),
            title: TextHelpers.mediumText(
              text: locale.select_your_nationality,
              fontSize: 16,
              textAlign: TextAlign.start,
            ),
            titlePadding: EdgeInsets.only(top: 4.h, bottom: 8.h),
            searchCursorColor: Theme.of(context).primaryColor,
            searchInputDecoration: InputDecoration(
              hintText: '${locale.search}...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(
                  color: kColors.primaryFixed,
                  width: 1.3,
                ),
              ),
            ),
            isSearchable: true,
            onValuePicked: (Country country) {
              if (kDebugMode) {
                log(country.isoCode, name: 'isoCode');
                log(country.iso3Code, name: 'iso3Code');
                log(country.phoneCode, name: 'phoneCode');
                log(country.name, name: 'name');
              }
              widget.onChanged?.call(country.name);
              _nationalityController.text = country.name;
              signUpCubit.signUpRequestModel.nationality = country.name;
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
      },
    );
  }

  Widget _buildDialogItem(Country country, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: context.colors.primary,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(50.r),
            child: SizedBox(
              width: 25.w,
              height: 25.h,
              child: CountryPickerUtils.getDefaultFlagImage(country),
            ),
          ),
          Gap(8.w),
          Flexible(
            child: TextHelpers.mediumText(
                text: country.name,
                fontSize: 12,
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);

    return Stack(
      alignment: AlignmentDirectional.centerEnd,
      children: [
        CustomInputField(
          controller: _nationalityController,
          hint: locale.nationality,
          readOnly: true,
          validator: (value) => Validators.validateNotEmpty(
              title: locale.nationality, value: value),
          prefixIcon: _selectedCountry != null
              ? Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: 8.h,
                    bottom: 8.h,
                    start: 16.w,
                    end: 8.w,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.r),
                    child: SizedBox(
                      width: 25.w,
                      height: 25.h,
                      child: CountryPickerUtils.getDefaultFlagImage(
                          _selectedCountry!),
                    ),
                  ),
                )
              : null,
          suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
        ),
        InkWell(
          onTap: () => _openCountryPickerDialog(context.read<SignUpCubit>()),
          borderRadius: BorderRadius.circular(16.r),
          child: SizedBox(
            height: 60.h,
            width: double.infinity,
          ),
        )
      ],
    );
  }
}
