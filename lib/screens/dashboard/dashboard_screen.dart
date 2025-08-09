import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smilecheck_ai/configs/app_colors.dart';
import 'package:smilecheck_ai/configs/app_topology.dart';
part './widgets/score_card.dart';
part './widgets/upload_and_ask_button.dart';
part './widgets/row_for_dashboard.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        12.verticalSpace,
        // Row(
        //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     CircleAvatar(
        //       radius: 24,
        //       backgroundImage: AssetImage('assets/profilepic.jpg'),
        //       // radius: 10.r,
        //     ),
        //     Align(
        //       alignment: Alignment.center,
        //       child: Image.asset('assets/mainLogo.png', height: 44.h),
        //     ),
        //   ],
        // ),
        Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ScoreCard(
                title: 'Total Score',
                value: '80',
                change: '+15',
                isIncrease: true,
                valueColor: Colors.black,
              ),
            ),

            Expanded(
              child: ScoreCard(
                title: 'High-Risk Teeth',
                value: '4',
                change: '-6',
                isIncrease: false,
                valueColor: AppColors.yellow,
              ),
            ),
          ],
        ),
        25.verticalSpace,
        BackGroundContainer(
          child: Row(
            spacing: 26,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RowForDashboard(title: 'Fillings', n: '3'),
                    RowForDashboard(title: 'Fillings', n: '3'),
                    RowForDashboard(title: 'Fillings', n: '3'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RowForDashboard(title: 'Fillings', n: '3'),
                    RowForDashboard(title: 'Fillings', n: '3'),
                    RowForDashboard(title: 'Fillings', n: '3'),
                  ],
                ),
              ),
            ],
          ),
        ),
        25.verticalSpace,

        Row(
          spacing: 10,
          children: [
            Expanded(
              child: UplaodAndAskButton(
                iconPath: 'assets/camera.svg',
                title: 'Upload Photo',
                description:
                    'Upload a photo to get your dental status instantly.',
              ),
            ),
            Expanded(
              child: UplaodAndAskButton(
                iconPath: 'assets/convo.svg',
                title: 'Ask SmileCheck',
                description:
                    'Chat with your AI dentist for instant advice and insights.',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
