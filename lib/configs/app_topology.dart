import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smilecheck_ai/configs/app_colors.dart';

class AppText {
  static final h1 = GoogleFonts.inter(
    fontWeight: FontWeight.w700,
    fontSize: 36.sp,
    color: Colors.white,
  );
  static final h2 = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 18.sp,
    color: Colors.white,
  );
  static final h3 = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    color: AppColors.textFieldGrey,
  );

  static final h4 = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 20.sp,
    color: Colors.white,
  );
  static final h5 = GoogleFonts.figtree(
    fontWeight: FontWeight.w600,
    fontSize: 32.sp,
    color: Colors.black,
  );
}
