import '../../../../core/constants/assets.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/widgets/svg_icons.dart';

class AuthHeaderWidget extends StatelessWidget {
  final double? marginTop;
  final double? marginBottom;
  const AuthHeaderWidget(
      {super.key, this.marginTop = 0.0, this.marginBottom = 0.0});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: marginTop ?? 0,
        ),
        Center(child: SVGIcons.localImage(headerAuthIconPath)),
        SizedBox(
          height: marginBottom ?? 0,
        ),
      ],
    );
  }
}
