import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:testing_git/core/utilss/app_colors.dart';
import 'package:testing_git/core/utilss/app_images.dart';

import 'intro_screen.dart';

class HomeScreen extends StatelessWidget{
  final introKey = GlobalKey<IntroductionScreenState>();
  static const bodyStyle = TextStyle(fontSize: 16);
  final pageDecoration = const PageDecoration(
    titleTextStyle: TextStyle(fontSize: 24,
        color: AppColors.primaryColor,
        fontWeight: FontWeight.bold),
    bodyTextStyle: TextStyle(fontSize: 16,
      color: AppColors.primaryColor,),
    imagePadding: EdgeInsets.only(top: 24),
  );

  final backgroundImage = const DecorationImage(
    image: AssetImage(AppImages.logo),
    fit: BoxFit.cover,
  );

  Widget _buildImage(String path, [double height = 175]) {
    return Image.asset(
      path.startsWith('assets/') ? path : 'assets/$path',
      height: height,
      fit: BoxFit.contain,
    );
  }
  void _onIntroEnd(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: AppColors.blackColor,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      infiniteAutoScroll: true,
      globalHeader: Align(
        alignment: Alignment.topCenter,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: _buildImage(AppImages.logo, 100),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: "",
          body: "Welcome To Islmi App",
          image: _buildImage(AppImages.welcome,),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Welcome To Islmi " ,
          body: "We Are Very Excited To Have You In Our \n Community",
          image: _buildImage(AppImages.welcome1,),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Raad the Quran",
          body: "Read, and your Lord is the Most Generous",
          image: _buildImage(AppImages.welcome2,),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Bearish",
          body: "Praise the name of your Lord, the Most High\n\n",
          image: _buildImage(AppImages.welcome3,),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Holy Quran Radio",
          body: "You can listen to the Holy Quran Radio through \n the application for free and easily",
          image: _buildImage(AppImages.welcome4,),
          decoration: pageDecoration.copyWith(
            bodyFlex: 6,
            imageFlex: 6,
            safeArea: 80,
          ),
        ),
      ],
      onDone: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => IntroScreen(),
          ),
        );
      },
      onSkip: () => _onIntroEnd(context),
      showSkipButton: true,
      showNextButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      showDoneButton: true,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Back', style: TextStyle(fontWeight: FontWeight.w600 ,
          color: AppColors.primaryColor)),
      next: const Icon(Icons.arrow_forward , color:AppColors.primaryColor ,),
      done: const Text('Finish', style: TextStyle(fontWeight: FontWeight.w600,
          color: AppColors.primaryColor)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: AppColors.grayColor,
        activeColor: AppColors.primaryColor,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
       // color: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}