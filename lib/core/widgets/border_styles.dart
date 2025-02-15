import 'package:flutter/material.dart';
import 'package:flutter_base/core/Constants/Constants.dart';

import '../Theme/app_theme.dart';

class AppBorders {
  static InputBorder outlineBorder({Color color = AppTheme.mainAppColor, BorderRadius? radius}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: radius ?? BorderRadius.circular(defaultButtonRadius),
    );
  }

  static InputBorder underlineBorder({Color color = Colors.transparent, BorderRadius? radius}) {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: radius ?? BorderRadius.circular(defaultButtonRadius),
    );
  }

  static InputBorder getBorder({Color? borderColor, BorderRadius? radius}) {
    return outlineBorder(color: borderColor ?? AppTheme.appGrey8, radius: radius ?? BorderRadius.circular(defaultButtonRadius));
  }

  static InputBorder getEnableBorder({Color enableColor = AppTheme.appGrey8, BorderRadius? radius}) {
    return outlineBorder(color: enableColor, radius: radius ?? BorderRadius.circular(defaultButtonRadius));
  }

  static InputBorder getErrorBorder({BorderRadius? radius}) {
    return outlineBorder(color: Colors.red, radius: radius??BorderRadius.circular(defaultButtonRadius));
  }
}
