import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing_git/core/utilss/app_colors.dart';
import 'package:testing_git/core/utilss/app_size.dart';
import 'package:testing_git/ui/screens/home/tabs/hadethTabs/widget/hadethItem.dart';

class Hadethtab extends StatelessWidget{
  List<int> itemIndex = List.generate(50, ((index) => index+1)) ;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: AppSize.getHeight(context)*663,
       enlargeCenterPage: true ,
      enableInfiniteScroll: false
      ),
      items: itemIndex.map((index) =>  Hadethitem(index: index,),
      ).toList(),
    );
  }
}