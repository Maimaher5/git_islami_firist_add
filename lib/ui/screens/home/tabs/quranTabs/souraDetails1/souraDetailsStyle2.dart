import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing_git/core/utilss/app_colors.dart';
import 'package:testing_git/core/utilss/app_font_style.dart';
import 'package:testing_git/model/quran_resourses.dart';
import 'package:testing_git/ui/screens/home/tabs/quranTabs/souraDetails1/souraContent1.dart';
import 'package:testing_git/ui/screens/home/tabs/quranTabs/soura_details/souraContent.dart';

import '../../../../../../core/utilss/app_size.dart';
import '../../../common/main_loading_widget.dart';

class Souradetailsstyle2 extends StatefulWidget {
  Souradetailsstyle2({super.key});

  @override
  State<Souradetailsstyle2> createState() => _Souradetailsstyle2State();
}

class _Souradetailsstyle2State extends State<Souradetailsstyle2> {
  String verses = '';

  @override
  Widget build(BuildContext context) {
    var index = ModalRoute.of(context)?.settings.arguments as int ;
    if(verses.isEmpty){
      loadSoraFiles(index);
    }
    return Scaffold(
        backgroundColor: AppColors.blackColor,
        appBar: AppBar(
          backgroundColor:AppColors.blackColor,
          title: Center(
            child: Text(QuranResourses.englishQuranSurahs[index] ,
              style: AppFontStyle.bold20primary,textAlign: TextAlign.center,),
          ),
        ),
        body:Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image:AssetImage('assets/images/Soura Details Screen.png') )
          ),
          padding: EdgeInsets.only(
            top: AppSize.getHeight(context)*.02,
            bottom:AppSize.getHeight(context)*.02 ,
          ),
          child:Column(
            spacing: AppSize.getHeight(context)*.06,
            children: [
              Text(QuranResourses.arabicAuranSuras[index] ,
                style: AppFontStyle.bold24primary,),
              Expanded(child:verses.isEmpty ?
              MainLoadingWidget()
                  :
              SingleChildScrollView(child: Souracontent1(content:verses ,)),
              ),
              SizedBox(height: AppSize.getHeight(context)*.02,)
            ],
          ) ,
        )
    );
  }

  void loadSoraFiles(int index) async{
    String fileContent = await rootBundle.loadString('assets/files/quran/Suras/${index+1}.txt') ;
    List<String> Lines =fileContent.split('\n');
    for (int i = 0 ; i<Lines.length ; i++){
      Lines[i]+= '[${ i+1}]' ;
    }
    verses = Lines.join('');
    setState(() {

    });
  }
}
