part of './brushing_bloc.dart';

class BrushingDataProvider {
  static Future<Map<String, dynamic>> dailyReminder(String email) async {
    final uri = Uri.parse(
      'https://ortho14.eu/api/v1/daily-reminders/streak/$email',
    );
    try {
      final response = await http.get(uri);
      // if (response.statusCode == 304) {
      return jsonDecode(response.body) as Map<String, dynamic>;
      // }
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> updateFrequency(Map<String, dynamic> data) async {
    final uri = Uri.parse(
      'https://ortho14.eu/api/v1/daily-reminders/update-frequency',
    );

    try {
      await http.put(uri, body: data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> todayStatus(String email) async {
    final uri = Uri.parse(
      'https://ortho14.eu/api/v1/daily-reminders/today-status/$email',
    );
    try {
      final response = await http.get(uri);
      // if (response.statusCode == 304) {
      return jsonDecode(response.body) as Map<String, dynamic>;
      // }
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> startSession(
    Map<String, dynamic> data,
  ) async {
    final uri = Uri.parse(
      'https://ortho14.eu/api/v1/daily-reminders/session/start',
    );

    try {
      final response = await http.post(
        uri,
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json', // Important header
          'Accept': 'application/json', // Optional, if you expect JSON back
        },
        // headers: {'Content-Type': 'application/json; charset=utf-8'},
      );
      print(response.statusCode);
      return jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> completeSession(
    Map<String, dynamic> data,
  ) async {
    final uri = Uri.parse(
      'https://ortho14.eu/api/v1/daily-reminders/session/complete',
    );

    try {
      final resp = await http.put(
        uri,
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json', // Important header
          'Accept': 'application/json', // Optional, if you expect JSON back
        },
      );
      return jsonDecode(resp.body) as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }
}
