import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smilecheck_ai/bloc/auth_bloc/auth_bloc.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smilecheck_ai/bloc/teeth_bloc/teeth_bloc.dart';

part 'brushing_event.dart';
part 'brushing_state.dart';
part './data_provider.dart';

class BrushingBloc extends Bloc<BrushingEvent, BrushingState> {
  BrushingBloc() : super(BrushingState()) {
    on<BrushingEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetStreaks>(getStreaks);
    on<UpdateTimer>(updateTimer);
  }

  void getStreaks(GetStreaks event, Emitter<BrushingState> emit) async {
    emit(state.copyWith(brushingStatus: Status.loading));

    try {
      final data = await BrushingDataProvider.dailyReminder(event.email);
      final todayStatus = await BrushingDataProvider.todayStatus(event.email);
      print(data);
      print(todayStatus);

      emit(BrushingState.fromJson(data['data'], todayStatus));
    } on Exception catch (e) {
      emit(state.copyWith(brushingStatus: Status.failure));
    }
  }

  void updateTimer(UpdateTimer event, Emitter<BrushingState> emit) async {
    emit(state.copyWith(updateStatus: Status.loading));

    try {
      final data = await BrushingDataProvider.startSession({
        'userEmail': event.email,
        'sessionType': event.type,
      });

      await BrushingDataProvider.completeSession({
        "sessionId": data['data']['_id'] as String,
        "timeSpent": 240,
      });
      final list = List<Session>.from(state.requiredSessions);
      if (event.type == 'morning') {
        list[0] = list[0].copyWith(completed: true);
      } else {
        list[1] = list[1].copyWith(completed: true);
      }

      emit(
        state.copyWith(updateStatus: Status.success, requiredSessions: list),
      );
    } on Exception catch (e) {
      emit(state.copyWith(updateStatus: Status.failure));
    }
  }
}
