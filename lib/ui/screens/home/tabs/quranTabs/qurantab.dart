import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_git/core/utilss/app_colors.dart';
import 'package:testing_git/core/utilss/app_font_style.dart';
import 'package:testing_git/core/utilss/app_images.dart';
import 'package:testing_git/core/utilss/app_routs.dart';
import 'package:testing_git/core/utilss/app_size.dart';
import 'package:testing_git/model/quran_resourses.dart';
import 'package:testing_git/ui/screens/home/tabs/quranTabs/souraItem.dart';

import 'mostRecentlyWidget.dart';

class Qurantab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.getWidth(context)*.04 ,
        vertical: AppSize.getHeight(context)*.01,
      ),
      child: Column(
        spacing:AppSize.getHeight(context)*.02 ,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _builtSearchSection(),
          MostRecentlyWidget(),
          Text('Soura List' , style: AppFontStyle.bold16white,),
          _builtSouraListView(
            onSouraItemClick: (index) {
              Navigator.of(context).pushNamed(AppRouts.souradetailsscreen,
                  arguments: index);
            },
          ),
        ],
      ),
    );
  }
  OutlineInputBorder _outlineInputBorder (){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color:
        AppColors.primaryColor,width: 2 )
    );
  }
  Widget _builtSearchSection(){
    return TextField(
      decoration:
      InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color:
          AppColors.primaryColor,width: 2 ),
        ),
        focusedBorder: _outlineInputBorder(),
        enabledBorder: _outlineInputBorder(),
        hintText: 'sura name',
        hintStyle: AppFontStyle.bold16white ,
        prefixIcon: Image.asset(AppImages.quranIcon , color: AppColors.primaryColor,),
      ),
      style: TextStyle(color: AppColors.whiteColor,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      cursorColor: AppColors.primaryColor,
    );
  }
  Widget _builtSouraListView({required void Function(int) onSouraItemClick}){
    return Expanded(child: ListView.separated(
        itemBuilder:(context, index) {
          return InkWell(onTap:(){ onSouraItemClick(index);} ,
              child: Souraitem(index: index,));
        },
        separatorBuilder: (context, index) {
          return Divider(thickness: 2,
            height: AppSize.getHeight(context)*.03,
            color: AppColors.whiteColor,
            indent:AppSize.getWidth(context)*.06,
            endIndent: AppSize.getWidth(context)*.06,);
        },
        itemCount:QuranResourses.AyaNumber.length ));
  }
}