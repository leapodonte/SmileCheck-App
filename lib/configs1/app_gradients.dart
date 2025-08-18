import 'package:flutter/cupertino.dart';
import 'package:smilecheck_ai/configs/configs.dart';
import 'package:smilecheck_ai/configs1/app_colors.dart';

class AppGradients {
  static final smile50 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.white, AppColors.buttonBlue],
  );

  static final smileCheckBox = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.buttonBlue.withValues(alpha: .8),
      AppColors.gradiantBlue,
      AppColors.gradiantGrey,
    ],
  );

  static final smileCheckWeb = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.white, AppTheme.c.backgroundSub!],
  );

  static final smileTypo = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      AppColors.gradiantBlack,
      AppColors.gradiantBlueSecond,
      AppColors.buttonBlue,
    ],
  );
}
