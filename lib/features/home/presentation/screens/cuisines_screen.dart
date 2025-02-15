import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/widgets/custom_app_bar.dart';
import '../../../../core/localization/Keys.dart';

class CuisinesScreen extends StatelessWidget {
  const CuisinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        navigated: true,
        appContext: context,
        title: context.tr(cuisinesKey),
      ),
      body: Container(),
    );
  }
}
