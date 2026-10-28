import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing_git/core/utilss/app_colors.dart';
import 'package:testing_git/core/utilss/app_font_style.dart';
import 'package:testing_git/model/quran_resourses.dart';
import 'package:testing_git/ui/screens/home/tabs/quranTabs/soura_details/souraContent.dart';

import '../../../../../../core/utilss/app_size.dart';
import '../../../common/main_loading_widget.dart';
import '../souraDetails1/souraContent1.dart';

class Souradetailsscreen extends StatefulWidget {
   Souradetailsscreen({super.key});

  @override
  State<Souradetailsscreen> createState() => _SouradetailsscreenState();
}

class _SouradetailsscreenState extends State<Souradetailsscreen> {
  List<String> verses = [];
  bool showCombinedStyle = false;
  int? selectedVerseIndex;

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
        actions: [
          IconButton(
            tooltip: showCombinedStyle ? 'Line by line' : 'Blocks',
            icon: Icon(
              showCombinedStyle ? Icons.view_agenda : Icons.menu_book,
              color: AppColors.primaryColor,
            ),
            onPressed: () {
              setState(() {
                showCombinedStyle = !showCombinedStyle;
              });
            },
          ),
        ],
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
          Expanded(
            child: verses.isEmpty
                ? MainLoadingWidget()
                : showCombinedStyle
                ? SingleChildScrollView(
              child: Souracontent1(
                content: verses
                    .asMap()
                    .entries
                    .map((entry) => '${entry.value} [${entry.key + 1}]')
                    .join(' '),
              ),
            )
                : ListView.separated(
              itemCount: verses.length,
              itemBuilder: (context, verseIndex) {
                return Souracontent(
                  content: verses[verseIndex],
                  index: verseIndex,
                  isSelected :  selectedVerseIndex== verseIndex ,
                  onTap :(){
                    setState(() {
                      selectedVerseIndex = selectedVerseIndex == verseIndex? null : verseIndex ;
                    });
                  },
                );
              },
              separatorBuilder: (context, index) =>
              const SizedBox(height: 5),
            ),
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
      print(Lines[i]);
    }
    verses = Lines ;
    setState(() {

    });
  }
}
