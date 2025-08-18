part of '../daily_reminder.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: value ? AppTheme.c.backgroundSub! : AppTheme.c.text!,
            width: 2,
          ),
          color: value ? AppTheme.c.backgroundSub : Colors.white,
        ),
        child: value
            ? const Center(
                child: Icon(
                  Icons
                      .check_rounded, // 🔁 Change this to any icon (e.g. Icons.done, Icons.thumb_up, etc.)
                  color: Colors.white,
                  size: 16,
                ),
              )
            : null,
      ),
    );
  }
}
