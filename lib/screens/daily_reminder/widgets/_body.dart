part of '../daily_reminder.dart';

class _Body extends StatelessWidget {
  const _Body();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/achievement.svg'),
            Text(
              'Brushing streak: 0 days',
              style: AppText.h8.copyWith(color: AppColors.secondaryText),
            ),
          ],
        ),
        Space.y1!,
        Row(
          spacing: 7,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DatePill(day: 'Sun', date: '24'),
            DatePill(day: 'Sun', date: '25'),
            DatePill(day: 'Sun', date: '26'),
            DatePill(day: 'Sun', date: '27'),
            DatePill(day: 'Sun', date: '28'),
            DatePill(day: 'Sun', date: '29'),
          ],
        ),
        Space.yf(42),
        Text('Today\'s check-in', style: AppTexts.h2bm!.cl(Colors.black)),
        Space.yf(24),
        RowForDailyReminder(
          title: 'Morning Check-in',
          description: 'Start your day with a fresh smile!',
          imagePath: 'assets/morning.png',
          isDone: false,
          onChange: (v) {},
        ),
        Space.y1!,
        RowForDailyReminder(
          title: 'Evening Check-in',
          description: 'End your day with clean teeth!',
          imagePath: 'assets/evening.png',
          isDone: true,
          onChange: (v) {},
        ),
      ],
    );
  }
}
