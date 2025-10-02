import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smilecheck_ai/bloc/auth_bloc/auth_bloc.dart';
import 'package:smilecheck_ai/bloc/teeth_bloc/teeth_bloc.dart';
import 'package:smilecheck_ai/configs/configs.dart';
import 'package:smilecheck_ai/configs1/app_colors.dart';
import 'package:smilecheck_ai/configs1/app_topology.dart';
import 'package:smilecheck_ai/routes/routes.dart';
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
                BlocConsumer<TeethBloc, TeethState>(
                  listener: (context, state) {
                    if (state.sessionStatus == Status.failure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to load history')),
                      );
                    }
                    if (state.sessionHistoryStatus == Status.failure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Failed to load history details'),
                        ),
                      );
                    }
                    if (state.sessionHistoryStatus == Status.success) {
                      AppRoutes.aiDentist.push(context);
                    }
                  },
                  builder: (context, state) {
                    if (state.sessionStatus == Status.loading) {
                      return Center(child: CircularProgressIndicator());
                    }

                    return Column(
                      spacing: 10.h,
                      children: state.sessions.map((e) {
                        return HistoryCard(
                          data: e.date,
                          image: e.image,
                          onTap: () {
                            context.read<TeethBloc>().add(
                              GetHistoryEvent(e.id),
                            );
                          },
                        );
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
