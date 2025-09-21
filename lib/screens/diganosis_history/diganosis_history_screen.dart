import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smilecheck_ai/bloc/auth_bloc/auth_bloc.dart';
import 'package:smilecheck_ai/bloc/teeth_bloc/teeth_bloc.dart';
import 'package:smilecheck_ai/configs1/app_colors.dart';
import 'package:smilecheck_ai/configs1/app_topology.dart';
import 'package:smilecheck_ai/screens/dashboard/dashboard_screen.dart';

part './widgets/history_card.dart';

class DiganosisHistoryScreen extends StatefulWidget {
  const DiganosisHistoryScreen({super.key});

  @override
  State<DiganosisHistoryScreen> createState() => _DiganosisHistoryScreenState();
}

class _DiganosisHistoryScreenState extends State<DiganosisHistoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TeethBloc>().add(SessionsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              spacing: 15,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BlocBuilder<TeethBloc, TeethState>(
                  builder: (context, state) {
                    if (state.status == Status.loading) {
                      return CircularProgressIndicator();
                    }
                    return Column(
                      children: state.sessions.map((e) {
                        return HistoryCard(data: e.date, image: e.image);
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
