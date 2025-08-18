part of '../dashboard_screen.dart';

class ScoreCard extends StatelessWidget {
  final String title;
  final String value;
  final String change;
  final bool isIncrease;
  final Color valueColor;

  const ScoreCard({
    super.key,
    required this.title,
    required this.value,
    required this.change,
    required this.isIncrease,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return BackGroundContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppText.h7.copyWith(
              fontSize: 16.sp,
              color: AppColors.textGreyLarge,
            ),
            maxLines: 1,
            // overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            mainAxisSize: MainAxisSize.min,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: AppText.h6.copyWith(
                  fontSize: 48.sp,
                  color: valueColor,
                  height: .8,
                ),

                // textHeightBehavior: const TextHeightBehavior(
                //   applyHeightToFirstAscent: false,
                //   applyHeightToLastDescent: false,
                // ),
              ),
              const SizedBox(width: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isIncrease
                        ? Icons.arrow_circle_up_rounded
                        : Icons.arrow_circle_down_rounded,
                    size: 17,
                    color: AppColors.grey,
                  ),
                  Text(
                    change,
                    style: AppText.h7.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BackGroundContainer extends StatelessWidget {
  const BackGroundContainer({
    super.key,
    required this.child,
    this.height = 110,
  });

  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: height.h,
      // width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
