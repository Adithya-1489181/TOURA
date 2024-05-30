import 'dart:io';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:toura/api_key.dart';

class GenAi {
  late final GenerativeModel _model;
  late final GenerativeModel _visionModel;
  late final ChatSession _chat;

  GenAi() {
    _model = GenerativeModel(model: 'gemini-1.5-pro', apiKey: api_key);
    _visionModel = GenerativeModel(model: 'gemini-pro-vision', apiKey: api_key);
    _chat = _model.startChat();
  }

  Future<String?> getAnswer(String text, String? path) async {
    late final GenerateContentResponse response;
    if (path != null) {
      final firstImage = await (File(path).readAsBytes());
      final prompt = TextPart(text);
      final imageParts = [
        DataPart('image/jpeg', firstImage),
      ];
      response = await _visionModel.generateContent([
        Content.multi([prompt, ...imageParts])
      ]);
    } else {
      var content = Content.text(text.toString());
      response = await _chat.sendMessage(content);
    }
    return response.text;
  }
}
