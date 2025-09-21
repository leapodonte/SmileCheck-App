import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthDataProvider {
  static Future<Map<String, dynamic>> signupUser(
    Map<String, dynamic> body,
  ) async {
    final url = Uri.parse("https://ortho14.eu/api/signup");
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return data;
      } else {
        throw Exception(
          "Signup failed [${response.statusCode}]: ${response.body}",
        );
      }
    } catch (e) {
      print("⚠️ Error: $e");
    }
    return {"error": "Error"};
  }

  static Future<bool> verifyUser(Map<String, dynamic> body) async {
    final url = Uri.parse("https://ortho14.eu/api/verify-code");
    print(body);
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('verified');
        final data = jsonDecode(response.body) as Map<String, dynamic>;

        print(data);
        return true;
      } else {
        throw Exception(
          "Signup failed [${response.statusCode}]: ${response.body}",
        );
      }
    } catch (e) {
      print("⚠️ Error: $e");
      rethrow;
    }
  }

  static Future<bool> loginUser(String email, String password) async {
    print('i am here');
    final csrfUrl = Uri.parse("https://ortho14.eu/api/auth/csrf");
    final csrfResponse = await http.get(
      csrfUrl,
      headers: {"Accept": "application/json"},
    );

    if (csrfResponse.statusCode != 200) {
      throw Exception("Failed to fetch CSRF token");
    }
    print(csrfResponse.body);

    final csrfData = jsonDecode(csrfResponse.body);
    final csrfToken = csrfData["csrfToken"] as String;
    print(csrfToken);
    final loginUrl = Uri.parse(
      "https://ortho14.eu/api/auth/signin/credentials",
    );
    final body = {
      "csrfToken": csrfToken,
      "email": email,
      "password": password,
      "redirect": false,
      "json": true,
      "callbackUrl": "https://ortho14.eu/signin",
    };

    final response = await http.post(
      loginUrl,
      headers: {
        "Content-Type": "application/json",
        // "Accept": "application/json",
      },
      body: jsonEncode(body),
    );

    print("Status: ${response.statusCode}");
    print("Body: ${response.body}");

    return response.statusCode == 200;
  }

  static Future<bool> sendverificationCode(Map<String, dynamic> body) async {
    final url = Uri.parse("https://ortho14.eu/api/send-verification-code");
    print(body);
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('verified');
        final data = jsonDecode(response.body) as Map<String, dynamic>;

        print(data);
        return true;
      } else {
        throw Exception(
          "Signup failed [${response.statusCode}]: ${response.body}",
        );
      }
    } catch (e) {
      print("⚠️ Error: $e");
      rethrow;
    }
  }
}
