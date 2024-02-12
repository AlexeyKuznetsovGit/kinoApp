import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kino_app/utils/pj_colors.dart';
import 'package:kino_app/utils/pj_styles.dart';

class PjAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PjAppBar({Key? key, required this.title, this.leading = false}) : super(key: key);

  final String title;
  final bool leading;

  @override
  Size get preferredSize => Size.fromHeight(45.w);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PjColors.white,
        boxShadow: [
          BoxShadow(color: PjColors.blue.withOpacity(0.1), spreadRadius: 0, blurRadius: 5, offset: Offset(0, 0))
        ],
      ),
      child: AppBar(
          leading: leading
              ? GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    context.router.pop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 24.w,
                    color: PjColors.black,
                  ),
                )
              : null,
          scrolledUnderElevation: 0,
          centerTitle: true,
          backgroundColor: PjColors.white,
          automaticallyImplyLeading: false,
          title: Text(
            title,
            style: PjStyles.styleBold,
          )),
    );
  }
}
