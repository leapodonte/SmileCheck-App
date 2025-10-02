import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smilecheck_ai/bloc/brushing_bloc/brushing_bloc.dart';
import 'package:smilecheck_ai/bloc/teeth_bloc/teeth_bloc.dart';
import 'package:smilecheck_ai/configs/configs.dart';
import 'package:smilecheck_ai/configs1/app_colors.dart';
import 'package:smilecheck_ai/configs1/app_gradients.dart';
part 'widgets/_body.dart';
part '_state.dart';

class DailyReminderTimerScreen extends StatelessWidget {
  const DailyReminderTimerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
