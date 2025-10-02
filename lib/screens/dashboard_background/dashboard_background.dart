import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smilecheck_ai/configs1/app_colors.dart';
import 'package:smilecheck_ai/screens/daily_reminder/daily_reminder.dart';
import 'package:smilecheck_ai/screens/dashboard/dashboard_screen.dart';
import 'package:smilecheck_ai/screens/diganosis_history/diganosis_history_screen.dart';
import 'package:smilecheck_ai/screens/profile/profile_screen.dart';

part './widgets/navigation_bar_item.dart';

class DashboardBackground extends StatefulWidget {
  const DashboardBackground({super.key});

  @override
  State<DashboardBackground> createState() => _DashboardBackgroundState();
}

class _DashboardBackgroundState extends State<DashboardBackground> {
  int currentIndex = 0;
  final List<IconData> _icons = [
    Icons.home_rounded,
    Icons.dangerous, // Use appropriate icon or SVG
    Icons.shield_outlined,
    Icons.person_outline,
  ];
  List<String> paths = ['home', 'st', 'teeth', 'profile'];
  ValueChanged<int>? onTap;
  List<Widget> screens = [
    DashboardScreen(),
    DiganosisHistoryScreen(),
    DailyReminderScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: CircleAvatar(
            radius: 12,
            backgroundImage: AssetImage('assets/profilepic.jpg'),
            // radius: 10.r,
          ),
        ),
        title: Image.asset('assets/mainLogo.png', height: 44.h),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
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
              child: Padding(
                padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                  // top: MediaQuery.paddingOf(context).top + 10,
                  // bottom: MediaQuery.paddingOf(context).bottom,
                ),
                child: screens[currentIndex],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 4,
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(4, (index) {
              return NavigationBarItem(
                path: paths[index],
                index: index,
                isSelected: currentIndex == index,
                icon: _icons[index],
                showNotificationDot: index == 2,
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
