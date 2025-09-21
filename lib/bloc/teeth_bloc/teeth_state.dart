part of 'teeth_bloc.dart';

class TeethState extends Equatable {
  final Status status;
  final List<Message> message;
  final String id;
  final List<Sessions> sessions;

  const TeethState({
    this.status = Status.initial,
    this.message = const [],
    this.id = '',
    this.sessions = const [],
  });

  TeethState copyWith({
    Status? status,
    List<Message>? message,
    String? id,
    List<Sessions>? sessions,
  }) {
    return TeethState(
      status: status ?? this.status,
      message: message ?? this.message,
      id: id ?? this.id,
      sessions: sessions ?? this.sessions,
    );
  }

  @override
  List<Object> get props => [status, message, id, sessions];
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
