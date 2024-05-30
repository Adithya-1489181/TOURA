import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toura/AI/gen_ai.dart';

class Message {
  String content;
  bool isFromUser;

  Message({required this.content, required this.isFromUser});
}

class MsgNotifier extends Notifier<List<Message>> {
  late GenAi genai;
  bool isTyping = false;

  MsgNotifier() {
    genai = GenAi();
  }

  @override
  List<Message> build() {
    return <Message>[];
  }

  Future<bool> add(String input) async {
    isTyping = true;
    state = [...state, Message(content: input, isFromUser: true)];
    String? response = await genai.getAnswer(input, null);
    isTyping = false;
    if (response == null) {
      return false;
    } else {
      state = [...state, Message(content: response, isFromUser: false)];
      return true;
    }
  }
}

final msgNotifierProvider = NotifierProvider<MsgNotifier, List<Message>>(() {
  return MsgNotifier();
});
