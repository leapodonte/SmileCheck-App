part of 'teeth_bloc.dart';

sealed class TeethEvent extends Equatable {
  const TeethEvent();
}

class PictureUploadEvent extends TeethEvent {
  final XFile file;
  const PictureUploadEvent({required this.file});
  @override
  List<Object> get props => [file];
}

class ContinueChattingEvent extends TeethEvent {
  final String message, id;
  final XFile? file;
  const ContinueChattingEvent({
    required this.message,
    required this.id,
    this.file,
  });

  @override
  List<Object?> get props => [message, id, file];
}

class SessionsEvent extends TeethEvent {
  @override
  List<Object?> get props => [];
}

class GetEmailEvent extends TeethEvent {
  final String email;
  const GetEmailEvent(this.email);

  @override
  List<Object?> get props => [];
}

class GetHistoryEvent extends TeethEvent {
  final String sessionId;
  const GetHistoryEvent(this.sessionId);

  @override
  List<Object?> get props => [sessionId];
}
