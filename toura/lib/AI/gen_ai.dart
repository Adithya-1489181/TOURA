import 'dart:typed_data';

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

  Stream<GenerateContentResponse> getAnswer(String text, Uint8List? image) {
    if (image != null) {
      final prompt = TextPart(text);
      final imageParts = [
        DataPart('image/jpeg', image),
      ];
      return _visionModel.generateContentStream([
        Content.multi([prompt, ...imageParts])
      ]);
    } else {
      var content = Content.text(text.toString());
      return _chat.sendMessageStream(content);
    }
  }
}
