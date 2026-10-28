import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing_git/core/utilss/app_colors.dart';
import 'package:testing_git/core/utilss/app_images.dart';
import 'package:testing_git/model/hadeth.dart';
import 'package:testing_git/ui/screens/home/common/main_loading_widget.dart';

import '../../../../../../core/utilss/app_font_style.dart';
import '../../../../../../core/utilss/app_size.dart';
import '../hadethContent.dart';

class Hadethitem extends StatefulWidget {
  int index ;

   Hadethitem({super.key , required this.index});

  @override
  State<Hadethitem> createState() => _HadethitemState();
}

class _HadethitemState extends State<Hadethitem> {
  Hadeth? hadeth ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadethFile();
  }
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: AppColors.primaryColor,
          image: DecorationImage(
            image: AssetImage(AppImages.hadethBackgroundShow),
            fit: BoxFit.fill,
          ),
        ),
      child: hadeth == null
          ? MainLoadingWidget(color: Colors.black)
          : Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.getWidth(context) * .05,
          vertical: AppSize.getHeight(context) * .04,
        ),
        child: Column(
          children: [
            Text(
              hadeth!.tittle,
              textAlign: TextAlign.center,
              style: AppFontStyle.bold24black,
            ),
            const SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                child: Hadethcontent(content: hadeth!.content),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void loadHadethFile() async{
    String hadethContentFiles = await rootBundle.loadString(
        'assets/files/hadeth/Hadeeth-20261027T142139Z-1-001/Hadeeth/h${widget.index}.txt');
    int newLineIndex = hadethContentFiles.indexOf('\n');
    String tittle = hadethContentFiles.substring(0 , newLineIndex);
    String Content = hadethContentFiles.substring(newLineIndex+1);
    hadeth = Hadeth(content: Content, tittle: tittle);
    setState(() {

    });
  }
}
