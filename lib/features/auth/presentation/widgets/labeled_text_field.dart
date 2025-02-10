import 'package:flutter/material.dart';
import 'package:flutter_base/core/Theme/app_theme.dart';
import 'package:flutter_base/core/widgets/app_text_field.dart';

class LabeledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Widget label;
  final bool? isvisible;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  const LabeledTextField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.label,
      this.onChanged,
      this.isvisible = false,
      this.suffixIcon,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label,
        SizedBox(height: 8),
        AppTextField(
          hintStyle: AppTheme.style14normalblack.copyWith(color: AppTheme.gray),
          hint: hint,
          borderRidus: BorderRadius.circular(8),
          secured: isvisible,
          textFieldBorderColor: AppTheme.blue,
          textEditingController: controller,
          onChanged: onChanged,
          validate: validator,
        ),
      ],
    );
  }
}
