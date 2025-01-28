import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/Assets.dart';

class SVGIcons {
  static Widget shareIcon(){
    return SvgPicture.asset(
      shareIconSvg,
      color: Colors.white,
      width: 40,
      height: 40,
    );
  }
  static Widget itemsIcon(){
    return SvgPicture.asset(
      itemsIconSvg,
      color: Colors.white,
      width: 30,
      height: 30,
    );
  }

  static Widget localSVG(String assetPath, {double width = 50, double height = 50}) {
    return SvgPicture.asset(
      assetPath,
      width: width,
      height: height,
    );
  }

  static Widget localImage(String assetPath) {
    return Image.asset(
      assetPath
    );
  }

  Widget networkSVG(link){
    return SvgPicture.network(
      link,
      color: Colors.white,
      width: 50,
      height: 50,
    );
  }

}