import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kino_app/utils/pj_colors.dart';
import 'package:kino_app/utils/pj_styles.dart';

void showAlertDialog(
  BuildContext context,
  String code,
  String message, [
  Function? callback,
  bool pop = false,
]) {
  showDialog(
    barrierColor: PjColors.black.withOpacity(0.5),
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        message,
        style: PjStyles.styleBold,
      ),
      content: Text(
        code,
        style: PjStyles.styleRegular,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
    ),
  ).then((value) {
    if (pop) {
      Navigator.of(context, rootNavigator: true).pop();
    }
    if (callback != null) {
      callback();
    }
  });
}
