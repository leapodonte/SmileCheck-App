part of '../daily_reminder.dart';

class _Body extends StatefulWidget {
  _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  // Subtract 3 days to get the starting date
  DateTime startOfWeek = DateTime.now().subtract(Duration(days: 3));

  @override
  void initState() {
    super.initState();
    final email = BlocProvider.of<TeethBloc>(context).state.id;
    context.read<BrushingBloc>().add(GetStreaks(email));
  }

  @override
  Widget build(BuildContext context) {
    final state = _ScreenState.s(context, true);
    return BlocBuilder<BrushingBloc, BrushingState>(
      builder: (context, blocState) {
        if (blocState.brushingStatus == Status.loading) {
          return Center(child: CircularProgressIndicator());
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/achievement.svg'),
                Text(
                  'Brushing streak: ${blocState.currentStreak} days',
                  style: AppText.h8.copyWith(color: AppColors.secondaryText),
                ),
              ],
            ),
            Space.y1!,
            Row(
              spacing: 4,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(7, (index) {
                DateTime day = startOfWeek.add(Duration(days: index));

                // Format the date as 'Day, dd/MM/yyyy'
                String formattedDate = DateFormat('EEE, dd').format(day);
                return DatePill(
                  day: formattedDate.substring(0, 3),
                  date: formattedDate.substring(5),
                  onTap: () => state.index = index,
                  color: state.index != index
                      ? AppTheme.c.text!
                      : AppTheme.c.backgroundSub,
                );
              }),
            ),
            Space.yf(42),
            Text('Today\'s check-in', style: AppTexts.h2bm!.cl(Colors.black)),
            Space.yf(24),
            ...blocState.requiredSessions.map((e) {
              return RowForDailyReminder(
                title: e.title,
                description: e.title == 'Evening'
                    ? 'End your day with clean teeth!'
                    : 'Start your day with a fresh smile!',
                imagePath: 'assets/${e.title.toLowerCase()}.png',
                isDone: e.completed,
                onChange: (v) {},
              );
            }),
            // RowForDailyReminder(
            //   title: 'Morning Check-in',
            //   description: 'Start your day with a fresh smile!',
            //   imagePath: 'assets/morning.png',
            //   isDone: false,
            //   onChange: (v) {},
            // ),
            // Space.y1!,
            // RowForDailyReminder(
            //   title: 'Evening Check-in',
            //   description: 'End your day with clean teeth!',
            //   imagePath: 'assets/evening.png',
            //   isDone: true,
            //   onChange: (v) {},
            // ),
          ],
        );
      },
    );
  }
}
