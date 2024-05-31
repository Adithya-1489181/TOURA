import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:toura/AI/gen_ai.dart';

class Message {
  String content;
  bool isFromUser;

  Message({required this.content, required this.isFromUser});
}

class MsgNotifier extends Notifier<List<Message>> {
  late GenAi genai;
  bool isAITyping = false;

  MsgNotifier() {
    genai = GenAi();
  }

  @override
  List<Message> build() {
    return <Message>[];
  }

  void _addToLastContent(String content) {
    state.last.content += content;
    state = [...state];
  }

  void userPrompt(String input) {
    isAITyping = true;
    state = [
      ...state,
      Message(content: input, isFromUser: true),
      Message(content: "", isFromUser: false),
    ];
    Stream<GenerateContentResponse> response = genai.getAnswer(input, null);
    response.listen(
      (data) {
        String? content = data.text;
        if (content != null) {
          _addToLastContent(content);
        }
      },
      onDone: () {
        isAITyping = false;
        state = [...state];
      },
      onError: (Object error) {
        isAITyping = false;
        state = [...state];
      },
      cancelOnError: true,
    );
  }
}

final msgNotifierProvider = NotifierProvider<MsgNotifier, List<Message>>(() {
  return MsgNotifier();
});
