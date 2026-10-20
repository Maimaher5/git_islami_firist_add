import 'package:flutter/material.dart';
import 'package:testing_git/core/utilss/app_colors.dart';
import 'package:testing_git/core/utilss/app_images.dart';
import 'package:testing_git/ui/screens/home/tabs/hadethTabs/hadethtab.dart';
import 'package:testing_git/ui/screens/home/tabs/quranTabs/qurantab.dart';
import 'package:testing_git/ui/screens/home/tabs/radioTabs/radiotab.dart';
import 'package:testing_git/ui/screens/home/tabs/sebhaTabs/sebhatab.dart';
import 'package:testing_git/ui/screens/home/tabs/timeTabs/timetab.dart';

class IntroScreen extends StatefulWidget{
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Widget> tabList = [
    Qurantab(), Hadethtab() , Sebhatab() , Radiotab(),Timetab(),
  ] ;
  List<String> backgroundImages = [
    AppImages.quranBackground,
    AppImages.hadethBackground,
    AppImages.sebhaBackground,
    AppImages.radioBackground,
    AppImages.timeBackground,
  ];
  int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparentColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.primaryColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.whiteColor,
          unselectedItemColor: AppColors.blackColor,
          currentIndex: selectedIndex,
          onTap: (index) {
          selectedIndex = index;
          setState(() {

          });
          },
          items:[
            builtBottomNavBarItem(icon: AppImages.quranIcon, label: 'Quran' ,index: 0),
            builtBottomNavBarItem(icon: AppImages.hadethIcon, label: 'Hadeth',index: 1),
            builtBottomNavBarItem(icon: AppImages.sebhaIcon, label: 'Sebha',index: 2),
            builtBottomNavBarItem(icon: AppImages.radioIcon, label: 'Radio',index: 3),
            builtBottomNavBarItem(icon: AppImages.timeIcon, label: 'Time',index: 4),

          ]
      ),
      body: Stack(
        children: [
          Image.asset(backgroundImages[selectedIndex],
          width: double.infinity,
          height: double.infinity ,fit: BoxFit.fill,),
          SafeArea(
          child: Column(
            children: [
              Image.asset(AppImages.logo),
              Expanded(child: tabList[selectedIndex]),
            ],
          ),
        ),]
      ),
    );
  }

  BottomNavigationBarItem builtBottomNavBarItem({
    required String icon , required String label , required int index
}){
    return BottomNavigationBarItem(
        icon: selectedIndex == index ?
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(66),
            color: AppColors.lightBlackColor
          ),
            padding: EdgeInsets.symmetric(
              vertical: 6,
              horizontal:20 ,
            ),
            child: Image.asset(icon)):
        Image.asset(icon) ,
             label: label) ;

  }
}