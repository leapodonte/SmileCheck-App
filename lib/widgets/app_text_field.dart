import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smilecheck_ai/configs/app_colors.dart';
import 'package:smilecheck_ai/configs/app_topology.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.validator,
    this.hintText,
    this.title,
    this.controller,
    this.onChanged,
  });

  final String? Function(String?)? validator;
  final String? hintText;
  final String? title;
  final TextEditingController? controller;
  final ValueChanged? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? '',
          style: AppText.h3.copyWith(color: AppColors.primaryText),
        ),
        8.verticalSpace,
        TextFormField(
          onChanged: onChanged,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              // vertical: 5,
              horizontal: 15,
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle: AppText.h3,
            // labelStyle: AppText.h3,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.textFieldBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.textFieldBorder),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.textFieldBorder),
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
