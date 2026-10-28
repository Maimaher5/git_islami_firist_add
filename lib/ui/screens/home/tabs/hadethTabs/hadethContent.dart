import 'package:flutter/cupertino.dart';
import 'package:testing_git/core/utilss/app_font_style.dart';

import '../../../../../../core/utilss/app_size.dart';

class Hadethcontent extends StatelessWidget {
  String content ;
  Hadethcontent({super.key , required this.content });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.getWidth(context) * .05,
      ),
      child: Text(content,
        style: AppFontStyle.bold24black.copyWith(fontSize: 16),
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
      ),
    );
  }
}
