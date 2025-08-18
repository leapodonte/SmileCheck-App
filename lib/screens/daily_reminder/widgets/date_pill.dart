part of '../daily_reminder.dart';

class DatePill extends StatelessWidget {
  final String day;
  final String date;

  const DatePill({super.key, required this.day, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 49.w,
      height: 83.h,
      decoration: BoxDecoration(
        color: AppTheme.c.text, // Outer pill background color
        borderRadius: BorderRadius.circular(100),
      ),
      padding: const EdgeInsets.all(3),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Circle for the date
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.c.white, // Circle background
            ),
            alignment: Alignment.center,
            child: Text(date, style: AppTexts.h2b!.cl(AppTheme.c.text!)),
          ),
          Space.yf(10),
          // Day text
          Text(day, style: AppTexts.b2bm!),
        ],
      ),
    );
  }
}
