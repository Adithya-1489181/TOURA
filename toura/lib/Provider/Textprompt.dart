// gemini_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http; // (Optional, if using http package)

class GeminiClient {
  final String baseUrl;
  final http.Client httpClient;

  GeminiClient({required this.baseUrl, required this.httpClient});

  Future<String?> get(String path) async {
    final response = await httpClient.get(Uri.parse(baseUrl + path));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, then parse the JSON.
      return response.body;
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      return null;
    }
  }
}

// Replace with your actual Gemini API endpoint and headers (if needed)
const String geminiEndpoint = 'https://your-gemini-api.com/generate';
final Map<String, String> geminiHeaders = {};

final geminiProvider = Provider<GeminiClient>((ref) => GeminiClient(
      baseUrl: geminiEndpoint,
      httpClient: http.Client(),
    ));
