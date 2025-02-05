import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_base/core/Theme/app_theme.dart';
import 'package:flutter_base/core/widgets/svg_icons.dart';
import 'package:flutter_base/features/auth/presentation/widgets/intl_phone_field.dart';
import 'package:flutter_base/features/auth/presentation/widgets/phone_number.dart';

class PhoneNumberField extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(PhoneNumber)? onChanged;
  final FutureOr<String?> Function(PhoneNumber?)? validator;
  const PhoneNumberField(
      {super.key, this.controller, this.onChanged, this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Phone Number",
          style: AppTheme.style14BoldBlack,
        ),
        SizedBox(height: 8),
        IntlPhoneField(
          dropdownTextStyle: AppTheme.fontStyle16color333740,
          dropdownIcon: SVGIcons.localSVG(
            "assets/images/arrowdown.svg",
            width: 20,
            height: 20,
          ),
          decoration: InputDecoration(
            hintText: "Enter phone number",
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.gray),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.gray),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.blue),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          initialCountryCode: 'US', // Set the default country
          onChanged: onChanged,
          controller: controller,
          validator: validator,
        ),
      ],
    );
  }
}
