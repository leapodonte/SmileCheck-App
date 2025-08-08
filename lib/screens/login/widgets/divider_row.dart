part of '../login_screen.dart';

class DividerRow extends StatelessWidget {
  const DividerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(thickness: 1, color: AppColors.iconGrey)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Or',
            style: AppText.h3.copyWith(color: AppColors.darkGrey),
          ),
        ),
        Expanded(child: Divider(thickness: 1, color: AppColors.iconGrey)),
      ],
    );
  }
}
