import 'package:flutter/material.dart';
import 'package:flutter_base/core/Theme/app_theme.dart';
import 'package:flutter_base/core/constants/constants.dart';
import 'package:flutter_base/core/widgets/app_button.dart';
import 'package:flutter_base/features/auth/presentation/providers/otp_provider.dart';
import 'package:flutter_base/features/auth/presentation/widgets/auth_header_widget.dart';
import 'package:flutter_base/features/auth/presentation/widgets/labeled_text_field.dart';
import 'package:flutter_base/features/auth/presentation/widgets/password_reset_bottom_sheet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/change_password_provider.dart';

class ChangePasswordBody extends ConsumerStatefulWidget {
  const ChangePasswordBody({super.key});

  @override
  ConsumerState<ChangePasswordBody> createState() => ChangePasswordBodyState();
}

class ChangePasswordBodyState extends ConsumerState<ChangePasswordBody> {
  final formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;

  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void initState() {
    // Add listeners to detect OTP changes
    for (var controller in [newPasswordController, confirmPasswordController]) {
      controller.addListener(_updateButtonState);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final changePsswordState = ref.watch(changePasswordProvider);
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
              AuthHeaderWidget(
                marginTop: 36,
                marginBottom: 64,
              ),
              LabeledTextField(
                isvisible: isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: AppTheme.gray,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
                controller: newPasswordController,
                hint: /* context.tr(OldPasswordKey) */ ".......",
                label: Text(
                  /* context.tr(OldPasswordKey) */ "New Password",
                  style: AppTheme.style14normalblack,
                ),
              ),
              SizedBox(height: 16),
              LabeledTextField(
                isvisible: isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: AppTheme.gray,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
                controller: confirmPasswordController,
                hint: /* context.tr(OldPasswordKey) */ ".......",
                label: Text(
                  /* context.tr(OldPasswordKey) */ "Confirm New Password ",
                  style: AppTheme.style14normalblack,
                ),
              ),
              SizedBox(height: 32),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPaddingHorizontal),
                  child: AppButton(
                      enabled: changePsswordState,
                      width: double.infinity,
                      height: defaultButtonHeight,
                      backColor: AppTheme.mainAppColor,
                      text: "save",
                      onPress: () {
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          builder: (context) {
                            return PasswordResetBottomSheet();
                          },
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var element in [newPasswordController, confirmPasswordController]) {
      element.dispose();
    }
    for (var controller in [newPasswordController, confirmPasswordController]) {
      controller.dispose();
    }
    super.dispose();
  }

  String get getCode => [newPasswordController, confirmPasswordController]
      .map((e) => e.text)
      .join("");

  void _updateButtonState() {
    bool allFull = [newPasswordController, confirmPasswordController]
        .every((c) => c.text.length == 1);
    ref.read(otpProvider.notifier).updateStatue(allFull);
  }
}
