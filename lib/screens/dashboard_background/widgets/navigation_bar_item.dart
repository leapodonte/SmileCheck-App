part of '../dashboard_background.dart';

class NavigationBarItem extends StatelessWidget {
  final int index;
  final bool isSelected;
  final IconData icon;
  final bool showNotificationDot;
  final VoidCallback onTap;
  final String path;

  const NavigationBarItem({
    super.key,
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
