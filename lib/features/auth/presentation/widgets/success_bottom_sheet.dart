
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/Constants/Constants.dart';
import '../../../../core/Theme/app_theme.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/svg_icons.dart';

class SuccessBottomSheet extends StatelessWidget {
  final VoidCallback clickAction ;
  final Widget? imageWidget;
  final String? title;
  final String? description;
  final String? btnName;
  const SuccessBottomSheet({super.key, required this.clickAction, this.imageWidget, this.title, this.description, this.btnName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPaddingHorizontal),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 15,
          ),
          imageWidget ?? SizedBox(),
          SizedBox(
            height: 32,
          ),
          Text(title??"",style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700,),
          SizedBox(
            height: title?.isNotEmpty == true ? 24 : 0,
          ),
          Text(description??"",style: AppTheme.styleWithTextAppGrey7AdelleSansExtendedFonts14w400,),
          SizedBox(
            height: description?.isNotEmpty == true ? 32 : 0,
          ),
          AppButton(
            backColor: AppTheme.mainAppColor,
              width: double.infinity,
              height: 56,
              text: btnName,
              onPress: (){
                context.pop();
                clickAction.call();
                // navigateToLogin(context);
              })
        ],
      ),
    );
  }
}