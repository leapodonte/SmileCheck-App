import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:share_plus/share_plus.dart';
import 'package:smilecheck_ai/bloc/auth_bloc/auth_bloc.dart';
import 'package:smilecheck_ai/bloc/teeth_bloc/data_provider.dart';

part 'teeth_event.dart';
part 'teeth_state.dart';

class TeethBloc extends Bloc<TeethEvent, TeethState> {
  TeethBloc() : super(TeethState()) {
    on<PictureUploadEvent>(pictureUploadEvent);
    on<ContinueChattingEvent>(continueChattingEvent);
    on<SessionsEvent>(sessionsEvent);
    on<GetEmailEvent>(getEmailEvent);
    on<GetHistoryEvent>(getHistoryEvent);
  }

  void pictureUploadEvent(
    PictureUploadEvent event,
    Emitter<TeethState> emit,
  ) async {
    emit(state.copyWith(pictureUploadStatus: Status.loading));
    final resp = await TeethDataProvider.uploadPicture(state.id, event.file);
    if (resp != null) {
      emit(
        state.copyWith(
          pictureUploadStatus: Status.success,
          message: parseMessages(resp['response']),
          sessionId: resp['sessionId'],
        ),
      );
    } else {
      emit(state.copyWith(pictureUploadStatus: Status.failure));
    }
  }

  void continueChattingEvent(
    ContinueChattingEvent event,
    Emitter<TeethState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    final resp = await TeethDataProvider.continueChatting(
      state.id,
      event.id,
      event.message,
      event.file,
    );
    if (resp != null) {
      emit(
        state.copyWith(
          status: Status.success,
          message: parseMessages(resp['response']),
          sessionId: resp['sessionId'],
        ),
      );
    } else {
      emit(state.copyWith(status: Status.failure));
    }
  }

  void sessionsEvent(SessionsEvent event, Emitter<TeethState> emit) async {
    print(state.id);
    emit(
      TeethState(
        sessionStatus: Status.loading,
        id: state.id,
        message: state.message,
      ),
    );
    print('i amhre');
    print(state.id);
    final resp = await TeethDataProvider.getSessions(state.id);
    if (resp != null) {
      emit(
        state.copyWith(
          sessionStatus: Status.success,
          sessions: parseSessions(resp['sessions']),
        ),
      );
    } else {
      emit(state.copyWith(sessionStatus: Status.failure));
    }
  }

  void getEmailEvent(GetEmailEvent event, Emitter<TeethState> emit) async {
    emit(state.copyWith(id: event.email));
  }

  void getHistoryEvent(GetHistoryEvent event, Emitter<TeethState> emit) async {
    emit(state.copyWith(sessionHistoryStatus: Status.loading));
    print(event.sessionId);
    print(state.id);
    final resp = await TeethDataProvider.history(state.id, event.sessionId);
    if (resp != null) {
      emit(
        state.copyWith(
          sessionHistoryStatus: Status.success,
          message: parseHistoryMessages(resp['response']['data']),
        ),
      );
    } else {
      emit(state.copyWith(sessionHistoryStatus: Status.failure));
    }
  }
}
