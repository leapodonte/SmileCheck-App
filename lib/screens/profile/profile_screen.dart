import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smilecheck_ai/configs1/app_colors.dart';
import 'package:smilecheck_ai/configs1/app_topology.dart';

part './widgets/menu_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        25.verticalSpace,
        ProfileCard(),
        70.verticalSpace,
        Column(
          spacing: 30,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MenuItem(icon: Icons.settings, title: 'Settings', onTap: () {}),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MenuItem(
                  icon: Icons.lock_outline,
                  title: 'Account Security',
                  onTap: () {},
                ),
                17.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 47.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: 0.7,
                          backgroundColor: AppColors.grey,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.darkGrey,
                          ),
                          minHeight: 8.h,
                        ),
                      ),
                      23.verticalSpace,
                      Text(
                        'Excellent',
                        style: AppText.h8.copyWith(
                          fontSize: 16.sp,
                          color: AppColors.iconGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            MenuItem(
              icon: Icons.help_outline,
              title: 'Customer Support',
              onTap: () {},
            ),
            MenuItem(icon: Icons.logout, title: 'Logout', onTap: () {}),
          ],
        ),
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Profile Image with status indicator
        Stack(
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 56.r,
              backgroundImage: AssetImage(
                'assets/profilepic.jpg',
              ), // Replace with your image path
            ),
            Positioned(
              bottom: 4,
              right: 4,
              child: Container(
                width: 22.w,
                height: 22.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 4),
                  shape: BoxShape.circle,
                  color: AppColors.secondaryText, // Online status color
                ),
              ),
            ),
          ],
        ),
        12.verticalSpace,
        Text('Xiaocong Liu', style: AppText.h9.copyWith(fontSize: 27.sp)),
        Text(
          'xiaocongliu@gmail.com',
          style: AppText.h8.copyWith(fontSize: 14.sp),
        ),
      ],
    );
  }
}
