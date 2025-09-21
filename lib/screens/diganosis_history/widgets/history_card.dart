part of '../diganosis_history_screen.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key, required this.data, this.image});
  final String data;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return BackGroundContainer(
      child: Column(
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('May 30, 2025', style: AppText.h8.copyWith(fontSize: 15.sp)),
              CircleWithIcon(),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,

            children: [
              if (image != null)
                Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(image!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Diagnostic Summary', style: AppText.h9),
                    Text(
                      'Tooth #14: Possible cavity\nTooth #23: Crown in place, no issue',
                      style: AppText.h2.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.primaryText.withValues(alpha: .5),
                      ),
                    ),
                    RowForCardHistory(
                      title: 'Total Score',
                      dec: '80',
                      color: Colors.black,
                    ),
                    RowForCardHistory(
                      title: 'Risk Level',
                      dec: 'Medium',
                      color: AppColors.yellow,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RowForCardHistory extends StatelessWidget {
  const RowForCardHistory({
    super.key,
    required this.title,
    required this.dec,
    required this.color,
  });
  final String title, dec;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppText.h10),
        Text(
          dec,
          style: AppText.h1.copyWith(color: color, fontSize: 18.sp),
        ),
      ],
    );
  }
}
