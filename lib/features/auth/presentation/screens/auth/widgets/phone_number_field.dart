import 'package:flutter/material.dart';
import 'package:flutter_base/core/Theme/app_theme.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({super.key});

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
          decoration: InputDecoration(
            labelText: "Phone Number",
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.gray),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.gray),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.gray),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          initialCountryCode: 'US', // Set the default country
          onChanged: (phone) {
            print("Country Code: ${phone.countryCode}");
            print("Phone Number: ${phone.number}");
          },
        ),
      ],
    );
  }
}
