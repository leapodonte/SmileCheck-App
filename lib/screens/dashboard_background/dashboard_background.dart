import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smilecheck_ai/configs/app_colors.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/profilepic.jpg'),
            // radius: 10.r,
          ),
        ),
        title: Image.asset('assets/mainLogo.png', height: 44.h),
        centerTitle: true,
      ),
      body: Container(
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
        child: Padding(padding: const EdgeInsets.all(40.0)),
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
              return _NavBarItem(
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

class _NavBarItem extends StatelessWidget {
  final int index;
  final bool isSelected;
  final IconData icon;
  final bool showNotificationDot;
  final VoidCallback onTap;
  final String path;

  const _NavBarItem({
    required this.index,
    required this.isSelected,
    required this.icon,
    this.showNotificationDot = false,
    required this.onTap,
    this.path = '',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SvgPicture.asset(
                  'assets/$path.svg',
                  color: isSelected
                      ? AppColors.secondaryText
                      : AppColors.iconGrey,
                ),

                if (showNotificationDot)
                  Positioned(
                    top: -2,
                    right: -2,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppColors.yellow,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 6),
            if (isSelected)
              Container(
                width: 5,
                height: 5,
                decoration: const BoxDecoration(
                  color: Color(0xFF007B8A),
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
