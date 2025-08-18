import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smilecheck_ai/configs/configs.dart';
import 'package:smilecheck_ai/routes/routes.dart';
import 'package:smilecheck_ai/widgets/app_text_field.dart';
import 'package:smilecheck_ai/widgets/botton_with_check.dart';
import 'package:smilecheck_ai/widgets/common_scaffold_screen.dart';
part 'widgets/_body.dart';
part '_state.dart';

class LoginWithEmailScreen extends StatelessWidget {
  const LoginWithEmailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: _Body(),
    );
  }
}
