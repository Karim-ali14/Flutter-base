import 'package:flutter_base/core/widgets/svg_icons.dart';
import 'package:flutter_base/features/auth/presentation/widgets/phone_number_field.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../providers/otp_provider.dart';
import '../widgets/auth_header_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/Constants/Constants.dart';
import '../../../../core/Theme/app_theme.dart';
import '../../../../core/localization/Keys.dart';
import '../widgets/labeled_text_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = true;

  @override
  void initState() {
    for (var controller in [_phoneController, _passwordController]) {
      controller.addListener(_updateLoginState);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final validationLoginState = ref.watch(loginProvider);
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
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal),
        child: Column(
          children: [
            AuthHeaderWidget(
              marginTop: 44,
              marginBottom: 64,
            ),
            PhoneNumberField(
              controller: _phoneController,
            ),
            SizedBox(height: 14),
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
              controller: _passwordController,
              hint: /* context.tr(OldPasswordKey) */ ".......",
              label: Text(
                "Password",
                style: AppTheme.style14BoldBlack,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                      enabled: validationLoginState,
                      height: defaultButtonHeight,
                      text: "Sign In",
                      onPress: () {}),
                ),
                SizedBox(
                  width: defaultPaddingHorizontal,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: validationLoginState
                          ? AppTheme.mainAppColor
                          : AppTheme.appGrey2,
                      borderRadius: BorderRadius.circular(8)),
                  width: 56,
                  height: 56,
                  child: Center(
                      child: SVGIcons.localSVG(faceId,
                          width: 32,
                          height: 32,
                          color: validationLoginState
                              ? Colors.white
                              : Colors.black)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _updateLoginState() {
    bool allFull = [_phoneController, _passwordController]
        .every((controller) => controller.text.length > 1);
    ref.read(loginProvider.notifier).updateStatue(allFull);
  }
}
