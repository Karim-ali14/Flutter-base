import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/Theme/app_theme.dart';
import 'package:flutter_base/core/constants/constants.dart';
import 'package:flutter_base/core/localization/Keys.dart';
import 'package:flutter_base/core/widgets/app_button.dart';
import 'package:flutter_base/core/widgets/app_text_field.dart';
import 'package:flutter_base/core/widgets/custom_app_bar.dart';
import 'package:flutter_base/features/auth/presentation/widgets/phone_number_field.dart';
import 'package:flutter_base/features/auth/presentation/widgets/auth_header_widget.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../widgets/labeled_text_field.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _firstNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        navigated: true,
        appContext: context,
        title: context.tr(SignInKey),
        trailingWidget: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal),
          child: Center(
            child: Text(
              "Arabic",
              style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w400,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AuthHeaderWidget(
              marginTop: 36,
              marginBottom: 64,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                    child: LabeledTextField(
                  controller: _firstNameController,
                  hint: "yourname",
                  label: Text(
                    "Firstname",
                    style: AppTheme.style14BoldBlack,
                  ),
                )),
                SizedBox(width: 8),
                Expanded(
                    child: LabeledTextField(
                  controller: _firstNameController,
                  hint: "yourname",
                  label: Text(
                    "Lastname",
                    style: AppTheme.style14BoldBlack,
                  ),
                )),
              ],
            ),
            SizedBox(height: 16),
            PhoneNumberField(),
            SizedBox(height: 16),
            LabeledTextField(
              controller: _firstNameController,
              hint: "example@gmail.com",
              label: Row(
                children: [
                  Text(
                    "Email",
                    style: AppTheme.style14BoldBlack,
                  ),
                  SizedBox(width: 12),
                  Text(
                    "(Optional)",
                    style: AppTheme.style14BoldBlack.copyWith(
                        color: AppTheme.gray, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            LabeledTextField(
              controller: _firstNameController,
              hint: "*****************************",
              label: Text(
                "Password",
                style: AppTheme.style14BoldBlack,
              ),
            ),
            SizedBox(height: 16),
            LabeledTextField(
              controller: _firstNameController,
              hint: "*****************************",
              label: Text(
                "Confirm Password",
                style: AppTheme.style14BoldBlack,
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Checkbox(
                    value: false,
                    side: BorderSide(color: AppTheme.mainAppColor, width: 1),
                    fillColor: WidgetStatePropertyAll(
                      Colors.transparent,
                    ),
                    onChanged: (value) {}),
                Text('Agree to ', style: AppTheme.styleblack16normal),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'The Terms and conditions',
                    style: AppTheme.styleblack16normal.copyWith(
                      color: AppTheme.mainAppColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            AppButton(
                width: double.infinity,
                height: defaultButtonHeight,
                backColor: AppTheme.mainAppColor,
                text: "Continue",
                onPress: () {}),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Have an account?   '),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Login',
                    style: AppTheme.styleblack16normal.copyWith(
                      color: AppTheme.mainAppColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
