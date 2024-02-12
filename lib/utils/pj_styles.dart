import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kino_app/utils/pj_colors.dart';

class PjStyles {
  static TextStyle styleRegular = TextStyle(
      color: PjColors.black,
      fontFamily: 'SFProText',
      fontWeight: FontWeight.w400,
      fontSize: 12.sp,
      leadingDistribution: TextLeadingDistribution.even,
      height: 18 / 12);
  static TextStyle styleBold = TextStyle(
      color: PjColors.black,
      fontFamily: 'SFProText',
      fontWeight: FontWeight.bold,
      fontSize: 20.sp,
      leadingDistribution: TextLeadingDistribution.even,
      height: 24 / 20);
}
