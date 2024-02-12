import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kino_app/models/search_models/docs_model.dart';
import 'package:kino_app/router/router.dart';
import 'package:kino_app/utils/pj_colors.dart';
import 'package:kino_app/utils/pj_styles.dart';
import 'package:kino_app/utils/singleton/sq_app_data.dart';

class KinoWidget extends StatelessWidget {
  const KinoWidget({super.key, required this.isFavourite, required this.kino, required this.onButtonTap});

  final DocsModel kino;
  final bool isFavourite;
  final Function() onButtonTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: SgAppData.instance.hasInternet
          ? () {
              context.router.push(DetailKinoRoute(id: kino.id!));
            }
          : () {},
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 10.w,
              horizontal: 20.w,
            ),
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
                bottom: 10.w),
            decoration: BoxDecoration(color: PjColors.white, borderRadius: BorderRadius.circular(10.r), boxShadow: [
              BoxShadow(color: PjColors.blue.withOpacity(0.1), spreadRadius: 0, blurRadius: 5, offset: Offset(0, 0))
            ]),
            child: Row(
              children: [
                SizedBox(
                  width: 200.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        kino.name ?? 'No Name',
                        style: PjStyles.styleBold,
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      Text(
                        kino.shortDescription ?? '',
                        style: PjStyles.styleRegular,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Icon(
                  Icons.star,
                  size: 20.w,
                  color: Colors.orangeAccent,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  kino.ratingImb ?? '',
                  style: PjStyles.styleBold,
                ),
              ],
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: onButtonTap,
            child: Container(
              height: 40.w,
              width: 40.w,
              margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05),
              decoration:
                  BoxDecoration(color: isFavourite ? PjColors.whiteBlue : PjColors.blue, shape: BoxShape.circle),
              child: Icon(
                Icons.heart_broken,
                size: 20.w,
                color: PjColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
