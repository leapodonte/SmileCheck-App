part of 'brushing_bloc.dart';

class BrushingState extends Equatable {
  final int currentStreak;
  final int longestStreak;
  final int brushingFrequency;
  final DateTime? lastCompletedDate;
  final bool todayComplete;
  final int todayCompletedCount;
  final List<Session> requiredSessions;
  final bool canIncrementToday;
  final Status brushingStatus;
  final Status updateStatus;

  const BrushingState({
    this.currentStreak = 0,
    this.longestStreak = 0,
    this.brushingFrequency = 0,
    this.lastCompletedDate,
    this.todayComplete = false,
    this.todayCompletedCount = 0,
    this.requiredSessions = const [],
    this.canIncrementToday = false,
    this.brushingStatus = Status.initial,
    this.updateStatus = Status.initial,
  });

  // fromJson factory constructor
  factory BrushingState.fromJson(
    Map<String, dynamic> json,
    Map<String, dynamic> todayStatus,
  ) {
    return BrushingState(
      currentStreak: json['currentStreak'] ?? 0,
      longestStreak: json['longestStreak'] ?? 0,
      brushingFrequency: json['brushingFrequency'] ?? 0,
      lastCompletedDate: json['lastCompletedDate'] != null
          ? DateTime.tryParse(json['lastCompletedDate'])
          : null,
      todayComplete: json['todayComplete'] ?? false,
      todayCompletedCount: json['todayCompletedCount'] ?? 0,
      requiredSessions: [
        Session(
          title: 'Morning',
          completed:
              todayStatus['data']['sessions']['morning']['completed'] ?? false,
          id: todayStatus['data']['sessions']['morning']['sessionId'],
        ),
        Session(
          title: 'Evening',
          completed:
              todayStatus['data']['sessions']['evening']['completed'] ?? false,
          id: todayStatus['data']['sessions']['evening']['sessionId'],
        ),
      ],
      canIncrementToday: json['canIncrementToday'] ?? false,
      brushingStatus: Status.success,
    );
  }

  // copyWith method
  BrushingState copyWith({
    int? currentStreak,
    int? longestStreak,
    int? brushingFrequency,
    DateTime? lastCompletedDate,
    bool? todayComplete,
    int? todayCompletedCount,
    List<Session>? requiredSessions,
    bool? canIncrementToday,
    Status? brushingStatus,
    Status? updateStatus,
  }) {
    return BrushingState(
      currentStreak: currentStreak ?? this.currentStreak,
      longestStreak: longestStreak ?? this.longestStreak,
      brushingFrequency: brushingFrequency ?? this.brushingFrequency,
      lastCompletedDate: lastCompletedDate ?? this.lastCompletedDate,
      todayComplete: todayComplete ?? this.todayComplete,
      todayCompletedCount: todayCompletedCount ?? this.todayCompletedCount,
      requiredSessions: requiredSessions ?? this.requiredSessions,
      canIncrementToday: canIncrementToday ?? this.canIncrementToday,
      brushingStatus: brushingStatus ?? this.brushingStatus,
      updateStatus: updateStatus ?? this.updateStatus,
    );
  }

  @override
  List<Object?> get props => [
    currentStreak,
    longestStreak,
    brushingFrequency,
    lastCompletedDate,
    todayComplete,
    todayCompletedCount,
    requiredSessions,
    brushingStatus,
    canIncrementToday,
    updateStatus,
  ];
}

class Session {
  final String title;
  final String? id;
  final bool completed;

  Session({this.completed = false, this.title = '', this.id});
}
