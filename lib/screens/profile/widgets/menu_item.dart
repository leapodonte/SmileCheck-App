part of '../profile_screen.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 32.sp, color: AppColors.darkGrey),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(
              title,
              style: AppText.h8.copyWith(color: AppColors.darkGrey),
            ),
          ),
          if (title != 'Logout')
            Icon(Icons.chevron_right, size: 24.sp, color: Colors.black54),
        ],
      ),
    );
  }
}
