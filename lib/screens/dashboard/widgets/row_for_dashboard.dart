part of '../dashboard_screen.dart';

class RowForDashboard extends StatelessWidget {
  const RowForDashboard({super.key, required this.title, required this.n});
  final String title, n;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppText.h8),
        Text(n, style: AppText.h8),
      ],
    );
  }
}
