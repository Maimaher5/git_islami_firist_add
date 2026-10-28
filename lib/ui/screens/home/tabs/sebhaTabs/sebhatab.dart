import 'package:flutter/material.dart';
import 'package:testing_git/core/utilss/app_colors.dart';
import 'package:testing_git/core/utilss/app_font_style.dart';
import 'package:testing_git/core/utilss/app_images.dart';

class Sebhatab extends StatefulWidget {
  const Sebhatab({super.key});

  @override
  State<Sebhatab> createState() => _SebhatabState();
}

class _SebhatabState extends State<Sebhatab>
    with SingleTickerProviderStateMixin {
  int count = 0;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }
  void _onSebhaTap() {
    setState(() {
      count++;
    });
    _controller.forward(from: 0);
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('سَبِّحِ اسْمَ رَبِّكَ الأعلى ' ,
            style: AppFontStyle.bold24white.copyWith(fontSize: 35),),
          SizedBox(height: 10),
          Transform.translate(
            offset: Offset(0, 12),
            child: Image.asset(AppImages.SebhaHead),
          ),
          GestureDetector(
            onTap: _onSebhaTap,
            child: Stack(
              children:[
                Column(
                  children: [
                    SizedBox(height: 130),
                    Center(
                      child: Text('سبحان الله',
                          style: AppFontStyle.bold24white.copyWith(fontSize: 35)),
                    ),
                    SizedBox(height: 15),
                    Text(
                      '$count', textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 40, color:AppColors.whiteColor ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                RotationTransition(
                turns: _animation,
                child: Center(child: Image.asset(AppImages.SebhaBody,)),
                ),
              ]
            ),
            ),
        ],
      ),
    );
  }
}