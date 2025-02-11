import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/Constants/Constants.dart';
import 'package:flutter_base/core/Theme/app_theme.dart';
import 'package:flutter_base/core/constants/assets.dart';
import 'package:flutter_base/core/widgets/circle_image.dart';
import 'package:flutter_base/core/widgets/svg_icons.dart';

class HorizontalRestaurantCard extends StatefulWidget {
  const HorizontalRestaurantCard({super.key});

  @override
  State<HorizontalRestaurantCard> createState() =>
      _HorizontalRestaurantCardState();
}

class _HorizontalRestaurantCardState extends State<HorizontalRestaurantCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 275,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: AppTheme.appGrey8,  // Border color
              width: 1.0,  // Border width
            ),
            right: BorderSide(
              color: AppTheme.appGrey8,
              width: 1.0,
            ),
            bottom: BorderSide(
              color: AppTheme.appGrey8,
              width: 1.0,
            ),
          ) ,
        color: Colors.white,
        borderRadius: BorderRadius.circular(defaultButtonRadius),
      ),
      child: Column(
        children: [
          SizedBox(
            width: 275,
            height: 115,
            child: Stack(
              children: [
                ImageView(
                  width: 275,
                  height: 115,
                  initialImg:
                      "https://t3.ftcdn.net/jpg/02/52/38/80/360_F_252388016_KjPnB9vglSCuUJAumCDNbmMzGdzPAucK.jpg",
                ),
                Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: Container(
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: defaultButtonRadius, vertical: 6),
                    decoration: BoxDecoration(
                        color: AppTheme.lightGreen,
                        borderRadius: BorderRadiusDirectional.only(
                            topEnd: Radius.circular(defaultButtonRadius))),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SVGIcons.localSVG(discountIconPath,
                            width: 16, height: 16),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "15% OFF",
                          style: AppTheme
                              .styleWithTextGreenAdelleSansExtendedFonts12w400,
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding:
                              const EdgeInsets.all(defaultPaddingHorizontal),
                          child: SVGIcons.localSVG(favoriteIconPath,
                              width: 24, height: 24),
                        )))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: defaultPaddingHorizontal),
            child: Column(
              children: [
                SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Tako",
                      style: AppTheme
                          .styleWithTextBlackAdelleSansExtendedFonts18w500,
                    ),
                    Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SVGIcons.localSVG(ratingStarIconPath,
                            width: 16, height: 16),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "4.5",
                          style: AppTheme
                              .styleWithTextBlackAdelleSansExtendedFonts14w500,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    SVGIcons.localSVG(clockIconPath, width: 16, height: 16),
                    Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 6.0),
                      child: Text(
                        "20 Mins",
                        style: AppTheme.styleWithAppGrey7Fonts14w400,
                      ),
                    ),
                    Container(
                      height: 4,
                      width: 4,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppTheme.appRed),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    SVGIcons.localSVG(clockIconPath, width: 16, height: 16),
                    Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 6.0),
                      child: Text(
                        "Mexican",
                        style: AppTheme.styleWithAppGrey7Fonts14w400,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    SVGIcons.localSVG(gpsIconPath, width: 16, height: 16),
                    Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 6.0),
                      child: Text(
                        "Madinty, South Park, B208",
                        style: AppTheme.styleWithAppGrey7Fonts14w400,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
