import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smilecheck_ai/configs/app_colors.dart';

class CommonScaffoldScreen extends StatelessWidget {
  const CommonScaffoldScreen({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leadingWidth: 60,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: CircleAvatar(
            maxRadius: 6,
            backgroundColor: AppColors.grey,
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 15,
            ),
          ),
        ),
        title: Image.asset('assets/mainLogo.png', height: 44.h),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: [.1, 5],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.white,
              AppColors.buttonBlue.withValues(alpha: .5),
            ],
          ),
        ),
        child: Padding(padding: const EdgeInsets.all(40.0), child: child),
      ),
    );
  }
}
