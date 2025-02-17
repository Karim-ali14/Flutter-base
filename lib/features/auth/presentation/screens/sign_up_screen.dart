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
  final FocusNode _focusNode = FocusNode();

  bool isFirstNameValidate = true;
  bool isLastNameValidate = true;
  bool isPhoneNumberValidate = true;
  bool isemailValidate = true;
  bool isPasswordValidate = true;
  bool isComfirmPasswordValidate = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        navigated: true,
        appContext: context,
        title: context.tr(signUpKey),
        trailingWidget: const Padding(
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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AuthHeaderWidget(
                marginTop: 36,
                marginBottom: 64,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: LabeledTextField(
                      controller: _firstNameController,
                      focusNode: _focusNode,
                      hint: "yourname",
                      isvalidate: isFirstNameValidate,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          isFirstNameValidate = false;
                          return "First name is required";
                        }
                        final RegExp nameRegExp = RegExp(r"^[a-zA-Z]{2,}$");
                        if (!nameRegExp.hasMatch(value)) {
                          isFirstNameValidate = false;

                          return "letters only, at least 2 characters";
                        }
                        isFirstNameValidate = true;

                        return null;
                      },
                      label: const Text(
                        "Firstname",
                        style: AppTheme.style14BoldBlack,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                      child: LabeledTextField(
                    isvalidate: isLastNameValidate,
                    controller: _lastNameController,
                    hint: "yourname",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        isLastNameValidate = false;
                        return "Last name is required";
                      }
                      final RegExp nameRegExp = RegExp(r"^[a-zA-Z]{2,}$");
                      if (!nameRegExp.hasMatch(value)) {
                        isLastNameValidate = false;

                        return "letters only, at least 2 characters";
                      }
                      isLastNameValidate = true;
                      return null;
                    },
                    label: const Text(
                      "Lastname",
                      style: AppTheme.style14BoldBlack,
                    ),
                  )),
                ],
              ),
              const SizedBox(height: 16),
              PhoneNumberField(
                isPhoneNumberIsValidate: isPhoneNumberValidate,
                controller: _phoneController,
                validator: (phone) {
                  if (phone == null || phone.isEmpty) {
                    isPhoneNumberValidate = false;
                    return 'Phone number is required';
                  }

                  final RegExp phoneRegExp = RegExp(r"^\+\d{1,3}\d{7,12}$");
                  if (!phoneRegExp.hasMatch(phone)) {
                    isPhoneNumberValidate = false;
                    return 'Enter a valid phone number (e.g., +1234567890)';
                  }
                  isPhoneNumberValidate = true;

                  return null;
                },
              ),
              const SizedBox(height: 16),
              LabeledTextField(
                isvalidate: isemailValidate,
                controller: _emailController,
                hint: "example@gmail.com",
                validator: (email) {
                  if (email != null && email.isNotEmpty) {
                    final RegExp emailRegExp = RegExp(
                        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                    if (!emailRegExp.hasMatch(email)) {
                      isemailValidate = false;
                      return 'Enter a valid email address';
                    }
                  }
                  isemailValidate = true;
                  return null; // Email is optional, so we allow empty input
                },
                label: Row(
                  children: [
                    const Text(
                      "Email",
                      style: AppTheme.style14BoldBlack,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "(Optional)",
                      style: AppTheme.style14BoldBlack.copyWith(
                          color: AppTheme.gray, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              LabeledTextField(
                isvalidate: isPasswordValidate,
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
                hint: "*****************************",
                errorMaxLine: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    isPasswordValidate = false;
                    return "Password is required";
                  }

                  final RegExp passwordRegExp =
                      RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,50}$");
                  if (!passwordRegExp.hasMatch(value)) {
                    isPasswordValidate = false;

                    return "Password must be at least 8 characters, include at least one letter and one number";
                  }
                  isPasswordValidate = true;

                  return null;
                },
                label: const Text(
                  "Password",
                  style: AppTheme.style14BoldBlack,
                ),
              ),
              const SizedBox(height: 16),
              LabeledTextField(
                isvalidate: isComfirmPasswordValidate,
                controller: _confirmPasswordController,
                isvisible: isPasswordVisibleConfirmPassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisibleConfirmPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppTheme.gray,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisibleConfirmPassword =
                          !isPasswordVisibleConfirmPassword;
                    });
                  },
                ),
                hint: "*****************************",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    isComfirmPasswordValidate = false;
                    return "Confirm Password is required";
                  }

                  final RegExp passwordRegExp =
                      RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,50}$");

                  if (!passwordRegExp.hasMatch(value)) {
                    setState(() {
                      isComfirmPasswordValidate = false;
                    });

                    return "Password must be at least 8 characters, include at least one letter and one number.";
                  } else if (value != _passwordController.text) {
                    setState(() {
                      isComfirmPasswordValidate = false;
                    });

                    return "Passwords do not match";
                  }
                  isComfirmPasswordValidate = true;

                  return null;
                },
                label: const Text(
                  "Confirm Password",
                  style: AppTheme.style14BoldBlack,
                ),
                errorMaxLine: 3, // Allows multi-line error messages if needed
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Checkbox(
                      value: false,
                      side: const BorderSide(
                          color: AppTheme.mainAppColor, width: 1),
                      fillColor: const WidgetStatePropertyAll(
                        Colors.transparent,
                      ),
                      onChanged: (value) {}),
                  const Text('Agree to ', style: AppTheme.styleblack16normal),
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
              const SizedBox(height: 24),
              AppButton(
                width: double.infinity,
                height: defaultButtonHeight,
                backColor: AppTheme.mainAppColor,
                text: "Continue",
                onPress: () {
                  if (_formKey.currentState!.validate()) {}

                  setState(() {});
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Have an account?   '),
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
