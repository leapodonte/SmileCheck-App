part of 'teeth_bloc.dart';

class TeethState extends Equatable {
  final Status status;
  final Status sessionStatus;
  final Status sessionHistoryStatus;
  final Status pictureUploadStatus;
  final List<Message> message;
  final String id;
  final String sessionId;
  final List<Sessions> sessions;

  const TeethState({
    this.status = Status.initial,
    this.sessionStatus = Status.initial,
    this.sessionHistoryStatus = Status.initial,
    this.pictureUploadStatus = Status.initial,
    this.message = const [],
    this.id = '',
    this.sessions = const [],
    this.sessionId = '',
  });

  TeethState copyWith({
    Status? status,
    List<Message>? message,
    String? id,
    List<Sessions>? sessions,
    Status? sessionStatus,
    Status? sessionHistoryStatus,
    String? sessionId,
    Status? pictureUploadStatus,
  }) {
    return TeethState(
      status: status ?? this.status,
      message: message ?? this.message,
      id: id ?? this.id,
      sessions: sessions ?? this.sessions,
      sessionStatus: sessionStatus ?? this.sessionStatus,
      sessionHistoryStatus: sessionHistoryStatus ?? this.sessionHistoryStatus,
      sessionId: sessionId ?? this.sessionId,
      pictureUploadStatus: pictureUploadStatus ?? this.pictureUploadStatus,
    );
  }

  @override
  List<Object> get props => [
    status,
    message,
    id,
    sessions,
    sessionStatus,
    sessionHistoryStatus,
    sessionId,
    pictureUploadStatus,
  ];
}

class Message {
  final String role, message;
  final String? image;

  Message({required this.role, required this.message, this.image});

  factory Message.fromJson(Map<String, dynamic> json) {
    // message can be direct text or array with text + optional image
    String messageText = "";
    String? imageUrl;

    if (json["content"] is String) {
      messageText = json["content"];
    } else if (json["content"] is List) {
      for (var item in json["content"]) {
        if (item["type"] == "text") {
          messageText += item["text"];
        } else if (item["type"] == "image_url") {
          imageUrl = item["image_url"]["url"];
        }
      }
    }

    return Message(
      role: json["role"] ?? "",
      message: messageText.trim(),
      image: imageUrl,
    );
  }
}

List<Message> parseMessages(List<dynamic> response) {
  return response.map((item) => Message.fromJson(item)).toList();
}

List<Message> parseHistoryMessages(Map<String, dynamic> response) {
  final ids = List<String>.from(response["id"]);
  final roles = List<String>.from(response["role"]);
  final texts = List<String>.from(response["text"]);
  final images = List<String?>.from(response["image"]);

  final messages = <Message>[];

  for (int i = 0; i < ids.length; i++) {
    messages.add(
      Message(
        role: roles[i],
        message: texts[i],
        image: images[i]?.isNotEmpty == true ? images[i] : null,
      ),
    );
  }

  return messages;
}

List<Sessions> parseSessions(List<dynamic> response) {
  return response.map((item) => Sessions.fromJson(item)).toList();
}

class Sessions {
  final String id, date;
  final String? image;
  Sessions({required this.id, required this.date, this.image});

  factory Sessions.fromJson(Map<String, dynamic> json) {
    // message can be direct text or array with text + optional image

    return Sessions(
      id: json["sessionId"] ?? "",
      date: json['createdAt'],
      image: json['firstImage'],
    );
  }
}
