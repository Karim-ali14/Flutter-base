import 'package:flutter_base/features/auth/presentation/widgets/phone_number_field.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/AuthHeaderWidget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/Constants/Constants.dart';
import '../../../../core/Theme/app_theme.dart';
import '../../../../core/localization/Keys.dart';
import '../widgets/colum_of_fields.dart';

//pupipii
class LoginScreen extends ConsumerStatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
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
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal),
        child: Column(
          children: [
            AuthHeaderWidget(
              marginTop: 36,
              marginBottom: 64,
            ),
            SizedBox(height: 16),
            PhoneNumberField(),
            SizedBox(height: 16),
            ColumOfFields(
              controller: _firstNameController,
              hint: "*****************************",
              label: Text(
                "Password",
                style: AppTheme.style14BoldBlack,
              ),
            ),
            AppButton(
                width: double.infinity,
                height: defaultButtonHeight,
                text: "ds",
                onPress: () {})
          ],
        ),
      ),
    );
  }
}
