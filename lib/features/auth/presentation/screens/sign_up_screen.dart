import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/Theme/app_theme.dart';
import 'package:flutter_base/core/constants/constants.dart';
import 'package:flutter_base/core/localization/Keys.dart';
import 'package:flutter_base/core/widgets/app_button.dart';
import 'package:flutter_base/core/widgets/custom_app_bar.dart';
import 'package:flutter_base/features/auth/presentation/widgets/phone_number_field.dart';
import 'package:flutter_base/features/auth/presentation/widgets/auth_header_widget.dart';

import '../widgets/labeled_text_field.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool isPasswordVisiblePassword = true;

  bool isPasswordVisibleConfirmPassword = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        navigated: true,
        appContext: context,
        title: context.tr(signUpKey),
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "first name is required";
                        }
                        return null;
                      },
                      label: Text(
                        "Firstname",
                        style: AppTheme.style14BoldBlack,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                      child: LabeledTextField(
                    controller: _lastNameController,
                    hint: "yourname",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "last name is required";
                      }
                      return null;
                    },
                    label: Text(
                      "Lastname",
                      style: AppTheme.style14BoldBlack,
                    ),
                  )),
                ],
              ),
              SizedBox(height: 16),
              PhoneNumberField(
                controller: _phoneController,
                validator: (phone) {
                  if (phone == null || phone.isEmpty) {
                    return 'Phone number is required';
                  } else if (phone.length < 8) {
                    return 'Phone number must be at least 8 digits';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              LabeledTextField(
                controller: _emailController,
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
                isvisible: isPasswordVisiblePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisiblePassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppTheme.gray,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisiblePassword = !isPasswordVisiblePassword;
                    });
                  },
                ),
                controller: _passwordController,
                hint: /* context.tr(OldPasswordKey) */ "**********",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  } else if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
                label: Text(
                  "Password",
                  style: AppTheme.style14BoldBlack,
                ),
              ),
              SizedBox(height: 16),
              LabeledTextField(
                controller: _confirmPasswordController,
                isvisible: isPasswordVisibleConfirmPassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisiblePassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppTheme.gray,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisiblePassword = !isPasswordVisiblePassword;
                    });
                  },
                ),
                hint: "*****************************",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Confirm Password is required";
                  } else if (value != _passwordController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
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
                onPress: () {
                  if (_formKey.currentState!.validate()) {}
                },
              ),
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
      ),
    );
  }
}
