import 'package:flutter/material.dart';
import 'package:flutter_base/core/Theme/app_theme.dart';
import 'package:flutter_base/core/constants/constants.dart';
import 'package:flutter_base/core/widgets/app_button.dart';
import 'package:flutter_base/features/auth/presentation/widgets/auth_header_widget.dart';
import 'package:flutter_base/features/auth/presentation/widgets/phone_number_field.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        height: double.infinity,
        padding:
            const EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 25),
              AuthHeaderWidget(
                marginTop: 36,
                marginBottom: 64,
              ),
              SizedBox(height: 25),
              PhoneNumberField(),
              SizedBox(height: 25),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPaddingHorizontal),
                  child: AppButton(
                      // enabled: changePsswordState,
                      width: double.infinity,
                      height: defaultButtonHeight,
                      backColor: AppTheme.mainAppColor,
                      text: "Send",
                      onPress: () {})),
            ],
          ),
        ),
      ),
    );
  }
}
