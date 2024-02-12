import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kino_app/utils/pj_colors.dart';
import 'package:kino_app/utils/pj_styles.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.focusNode
  });

  final TextEditingController controller;
  final Function(String) onChanged;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
      height: 40.w,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r), color: PjColors.white, boxShadow: [
        BoxShadow(color: PjColors.blue.withOpacity(0.1), spreadRadius: 0, blurRadius: 5, offset: Offset(0, 0))
      ]),
      child: TextFormField(
        focusNode: focusNode,
        controller: controller,
        onChanged: onChanged,
        textCapitalization: TextCapitalization.sentences,
        cursorColor: PjColors.blue,
        keyboardType: TextInputType.text,
        style: PjStyles.styleRegular,
        decoration: InputDecoration(
          hintText: 'Введите название фильма',
          hintStyle: PjStyles.styleRegular.copyWith(color: PjColors.black.withOpacity(0.3)),
          prefixIcon: Icon(
            Icons.search,
            size: 20.w,
          ),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          isDense: true,
          isCollapsed: true,
          contentPadding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.w),
        ),
      ),
    );
  }
}