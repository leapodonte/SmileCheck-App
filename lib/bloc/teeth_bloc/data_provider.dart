import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smilecheck_ai/bloc/teeth_bloc/teeth_bloc.dart';

class TeethDataProvider {
  static Future<Map<String, dynamic>?> uploadPicture(
    String email,
    XFile file,
  ) async {
    final uri = Uri.parse("https://ortho14.eu/api/v1/aiteethreview");

    final request = http.MultipartRequest("POST", uri)
      ..fields['userEmail'] = email
      ..fields['text'] = "Can you analyze my teeth?"
      ..files.add(
        await http.MultipartFile.fromBytes(
          'file',
          await file.readAsBytes(),
          filename: file.name,
          contentType: MediaType('image', 'png'), // or jpg depending on file
        ),
      );

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    print("Status: ${response.statusCode}");
    print("Body: ${response.body}");

    if (response.statusCode == 200) {
      final text = jsonDecode(response.body) as Map<String, dynamic>;
      return text;
    }

    return null;
  }

  static Future<Map<String, dynamic>?> continueChatting(
    String email,
    String sessionId,
    String text,
    XFile? file,
  ) async {
    final uri = Uri.parse("https://ortho14.eu/api/v1/aiteethreview");

    final request = http.MultipartRequest("POST", uri)
      ..fields['userEmail'] = email
      ..fields['sessionId'] = sessionId
      ..fields['text'] = text;
    // ..files.add(
    //   await http.MultipartFile.fromBytes(
    //     'file',
    //     await file.readAsBytes(),
    //     filename: file.name,
    //     contentType: MediaType('image', 'png'), // or jpg depending on file
    //   ),
    // );

    if (file != null) {
      request.files.add(
        http.MultipartFile.fromBytes(
          'file',
          await file.readAsBytes(),
          filename: file.name,
          contentType: MediaType('image', 'png'), // or jpg depending on file
        ),
      );
    }

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    print("Status: ${response.statusCode}");
    print("Body: ${response.body}");

    if (response.statusCode == 200) {
      final text = jsonDecode(response.body) as Map<String, dynamic>;
      return text;
    }

    return null;
  }

  static Future<Map<String, dynamic>?> getSessions(String email) async {
    final uri = Uri.parse("https://ortho14.eu/api/v1/aiteethreview/sessions");

    final response = await http.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        // "Accept": "application/json",
      },
      body: jsonEncode({"userEmail": email}),
    );
    print("Status: ${response.statusCode}");
    print("Body: ${response.body}");

    if (response.statusCode == 200) {
      final text = jsonDecode(response.body) as Map<String, dynamic>;
      return text;
    }

    return null;
  }
}
