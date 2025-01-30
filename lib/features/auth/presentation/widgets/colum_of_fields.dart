import 'package:flutter/material.dart';
import 'package:flutter_base/core/Theme/app_theme.dart';
import 'package:flutter_base/core/widgets/app_text_field.dart';

class ColumOfFields extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Widget label;

  ColumOfFields(
      {super.key,
      required this.controller,
      required this.hint,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label,
        SizedBox(height: 8),
        AppTextField(
          hintStyle: AppTheme.style14normalgrey,
          hint: hint,
          borderRidus: BorderRadius.circular(8),
          textFieldBorderColor: AppTheme.gray,
          textEditingController: controller,
        ),
      ],
    );
  }
}
