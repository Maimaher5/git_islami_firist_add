import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing_git/core/utilss/app_colors.dart';

class MainLoadingWidget extends StatelessWidget {
  final Color? color ;
  const MainLoadingWidget({super.key , this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color?? AppColors.primaryColor,
      ),
    );
  }
}
