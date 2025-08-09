import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smilecheck_ai/configs/app_colors.dart';
import 'package:smilecheck_ai/configs/app_topology.dart';
import 'package:smilecheck_ai/screens/dashboard/dashboard_screen.dart';

part './widgets/history_card.dart';

class DiganosisHistoryScreen extends StatefulWidget {
  const DiganosisHistoryScreen({super.key});

  @override
  State<DiganosisHistoryScreen> createState() => _DiganosisHistoryScreenState();
}

class _DiganosisHistoryScreenState extends State<DiganosisHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [HistoryCard(), HistoryCard(), HistoryCard()],
    );
  }
}
