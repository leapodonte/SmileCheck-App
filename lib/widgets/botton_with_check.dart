import 'package:flutter/material.dart';
import 'package:smilecheck_ai/configs1/app_colors.dart';
import 'package:smilecheck_ai/configs1/app_topology.dart';

class CustomButtonWithCheck extends StatelessWidget {
  const CustomButtonWithCheck({
    super.key,
    this.onPressed,
    required this.title,
    required this.check,
  });

  final VoidCallback? onPressed;
  final String title;
  final bool check;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: check ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: check ? AppColors.grey : AppColors.buttonBlue,
        padding: EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      child: Text(title, style: AppText.h4.copyWith(color: Colors.white)),
    );
  }
}
