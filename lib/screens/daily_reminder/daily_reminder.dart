import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smilecheck_ai/bloc/auth_bloc/auth_bloc.dart';
import 'package:smilecheck_ai/bloc/brushing_bloc/brushing_bloc.dart';
import 'package:smilecheck_ai/bloc/teeth_bloc/teeth_bloc.dart';
import 'package:smilecheck_ai/configs/configs.dart';
import 'package:smilecheck_ai/configs1/app_colors.dart';
import 'package:smilecheck_ai/configs1/app_topology.dart';
import 'package:smilecheck_ai/routes/routes.dart';
import 'package:smilecheck_ai/screens/dashboard/dashboard_screen.dart';
part 'widgets/_body.dart';
part '_state.dart';
part './widgets/row_for_daily_reminder.dart';
part './widgets/custom_checkbox.dart';
part './widgets/date_pill.dart';

class DailyReminderScreen extends StatelessWidget {
  const DailyReminderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: _Body(),
    );
  }
}
