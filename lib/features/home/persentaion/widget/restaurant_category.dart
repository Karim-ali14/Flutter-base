import 'package:flutter/cupertino.dart';
import 'package:flutter_base/core/Constants/Constants.dart';
import 'package:flutter_base/core/Theme/app_theme.dart';
import 'package:flutter_base/core/widgets/circle_image.dart';

class RestaurantCategory extends StatelessWidget {
  const RestaurantCategory({super.key});

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
            initialImg: "https://t3.ftcdn.net/jpg/02/52/38/80/360_F_252388016_KjPnB9vglSCuUJAumCDNbmMzGdzPAucK.jpg"
          ),

          Container(
            width: 110,
            height: 80,
            color: CupertinoColors.black.withOpacity(.4),
          ),
          Align(
            alignment: Alignment.center,
            child: Text("fjasdlkfj",style: AppTheme.styleWithTextWhiteAdelleSansExtendedFonts16w500,),
          ),
        ],
      ),
    );
  }
}
