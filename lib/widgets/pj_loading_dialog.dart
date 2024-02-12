import 'package:flutter/material.dart';
import 'package:kino_app/utils/pj_colors.dart';

void showLoader(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Center(
            child: CircularProgressIndicator(
              color: PjColors.blue,
            ),
          ));
}
