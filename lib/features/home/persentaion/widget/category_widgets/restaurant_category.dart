import 'package:flutter/cupertino.dart';
import 'package:flutter_base/core/Constants/Constants.dart';
import 'package:flutter_base/core/Theme/app_theme.dart';
import 'package:flutter_base/core/widgets/circle_image.dart';

class RestaurantCategory extends StatelessWidget {
  final String? categoryImg;
  final String? categoryName;
  const RestaurantCategory({super.key, this.categoryImg, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 80,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultButtonRadius)
      ),
      child: Stack(
        children: [

          ImageView(
            width: 110,
            height: 80,
            initialImg: categoryImg
          ),

          Container(
            width: 110,
            height: 80,
            color: CupertinoColors.black.withOpacity(.3),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(categoryName??"",style: AppTheme.styleWithTextWhiteAdelleSansExtendedFonts16w500,),
          ),
        ],
      ),
    );
  }
}
