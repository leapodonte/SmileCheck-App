part of '../dashboard_screen.dart';

class UplaodAndAskButton extends StatelessWidget {
  const UplaodAndAskButton({
    super.key,
    required this.iconPath,
    required this.title,
    required this.description,
    this.onTap,
  });
  final String iconPath, title, description;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: BackGroundContainer(
        // height: 160,
        child: Column(
          children: [
            SvgPicture.asset(iconPath, width: 43.w, height: 43.h),
            Text(
              title,
              style: AppText.h7.copyWith(color: Colors.black, fontSize: 15.sp),
            ),
            Text(
              description,
              style: AppText.h7.copyWith(fontSize: 10.sp),
              textAlign: TextAlign.center,
            ),
            12.verticalSpace,
            CircleWithIcon(),
          ],
        ),
      ),
    );
  }
}

class CircleWithIcon extends StatelessWidget {
  const CircleWithIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 17,
      backgroundColor: AppColors.grey,
      child: Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 18),
    );
  }
}
