part of 'brushing_bloc.dart';

sealed class BrushingEvent extends Equatable {
  const BrushingEvent();

  @override
  List<Object> get props => [];
}

class GetStreaks extends BrushingEvent {
  final String email;
  const GetStreaks(this.email);
  @override
  List<Object> get props => [email];
}

class UpdateTimer extends BrushingEvent {
  final String email, type;
  const UpdateTimer(this.email, this.type);
  @override
  List<Object> get props => [email, type];
}
