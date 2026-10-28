import 'package:flutter/cupertino.dart';
import 'package:testing_git/core/utilss/app_colors.dart';
import 'package:testing_git/core/utilss/app_font_style.dart';
import 'package:testing_git/model/quran_resourses.dart';

import '../../../../../core/utilss/app_size.dart';

class Souraitem extends StatelessWidget {
  final index ;
  const Souraitem({super.key , required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing:AppSize.getHeight(context)*.02,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/img_sur_number_frame.png'),
            Text('${index+1}' ,style: TextStyle(
                color: AppColors.whiteColor),)
          ],
        ),
        Column(
          spacing: AppSize.getHeight(context)*.01,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(QuranResourses.englishQuranSurahs[index],
            style: AppFontStyle.bold20white,),
            Text('${QuranResourses.AyaNumber[index]}   Verses',
            style: AppFontStyle.bold14white,),
          ],
        ),
        Spacer(),
        Text(QuranResourses.arabicAuranSuras[index],
          style: AppFontStyle.bold20white,),
      ],
    );
  }
}
