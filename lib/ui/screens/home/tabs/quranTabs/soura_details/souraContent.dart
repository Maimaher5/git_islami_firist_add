import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing_git/core/utilss/app_colors.dart';
import 'package:testing_git/core/utilss/app_font_style.dart';

import '../../../../../../core/utilss/app_size.dart';

class Souracontent extends StatelessWidget {
  final String content;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const Souracontent({
    super.key,
    required this.content,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.primaryColor,
            width: 2,
          ),
        ),
        margin: EdgeInsets.symmetric(
            horizontal:AppSize.getHeight(context)*.02,
        vertical: AppSize.getWidth(context)*.02,),
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.getHeight(context)*.02,
            vertical: AppSize.getWidth(context)*.05,
        ),
        child: Text('$content [${index+1}]' ,
          style:
          isSelected ?
              AppFontStyle.bold24black.copyWith(fontSize: 20)
          :AppFontStyle.bold20primary,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
