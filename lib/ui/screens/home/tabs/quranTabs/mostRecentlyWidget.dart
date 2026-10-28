import 'package:flutter/cupertino.dart';
import 'package:testing_git/core/utilss/app_colors.dart';
import 'package:testing_git/core/utilss/app_font_style.dart';

import '../../../../../core/utilss/app_size.dart';

class MostRecentlyWidget extends StatelessWidget {
  const MostRecentlyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ 
        Text('Most Recently' , style: AppFontStyle.bold16white,),
        SizedBox(
          height: AppSize.getHeight(context)*.18 ,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
              itemBuilder:(context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor ,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.getWidth(context)*.04,
                      vertical: AppSize.getHeight(context)*.0004
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Elanbia' ,
                              style:AppFontStyle.bold24black
                            ,),
                            Text('الانبياء' ,
                              style:AppFontStyle.bold24black
                              ,),
                            Text('112 Verses' ,
                              style:AppFontStyle.bold24black.copyWith(fontSize: 14),
                              )
                          ],
                        ),
                        Image.asset('assets/images/img_most_recent.png'),
                      ],
                    ),
                  ),
                );
              } ,
              separatorBuilder:(context, index) {
                return SizedBox(width:AppSize.getWidth(context)*.04) ;
              },
              itemCount: 20),
        )
      ],
    );
  }
}
