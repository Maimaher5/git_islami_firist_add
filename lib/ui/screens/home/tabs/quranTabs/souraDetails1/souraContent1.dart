import 'package:flutter/cupertino.dart';
import 'package:testing_git/core/utilss/app_font_style.dart';

import '../../../../../../core/utilss/app_size.dart';

class Souracontent1 extends StatelessWidget {
  String content ;
  Souracontent1({super.key , required this.content });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.getWidth(context)*.04
      ),
      child: Text(content,
        style: AppFontStyle.bold20primary,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
      ),
    );
  }
}
