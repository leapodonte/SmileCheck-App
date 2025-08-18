part of '../daily_reminder.dart';

class RowForDailyReminder extends StatelessWidget {
  const RowForDailyReminder({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.isDone,
    required this.onChange,
  });
  final String title, description, imagePath;
  final bool isDone;
  final ValueChanged<bool> onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCheckbox(value: isDone, onChanged: onChange),
        Space.xf(10),
        // HistoryCard(),
        Expanded(
          child: BackGroundContainer(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15,
              children: [
                Container(
                  width: 96.w,
                  height: 96.h,
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: AppText.h9),
                      Text(
                        description,
                        style: AppText.h2.copyWith(
                          fontSize: 14.sp,
                          color: AppColors.primaryText.withValues(alpha: .5),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            color: AppTheme.c.fieldDark,
                          ),
                          Space.xf(5),
                          Text(
                            '2 mins',
                            style: AppTexts.b2bm!.cl(AppTheme.c.fieldDark!),
                          ),
                          Space.xf(14),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                if (!isDone) {
                                  AppRoutes.dailyReminderTimer.push(context);
                                }
                              },
                              child: Container(
                                height: 36.h,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.r),
                                  color: isDone
                                      ? AppTheme.c.text!
                                      : AppTheme.c.backgroundSub,
                                ),
                                child: Center(
                                  child: Text(
                                    isDone ? "Finished" : 'Start',
                                    style: AppTexts.b2b!.cl(Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
