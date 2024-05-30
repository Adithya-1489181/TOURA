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
    return <Message>[
      Message(content: "Hello", isFromUser: true),
      Message(content: "content", isFromUser: false),
      Message(
          content:
              "Eu velit et cupidatat mollit labore esse ea aute deserunt quis et laboris ea.",
          isFromUser: true),
      Message(
          content:
              """Deserunt est laboris exercitation nulla aliquip. Laborum officia sit elit qui dolore qui laborum aliqua aliqua id cillum voluptate et dolore. Laborum cupidatat voluptate est aliqua. Pariatur est est cupidatat Lorem tempor consequat aliquip tempor nostrud eiusmod voluptate proident est velit.

Incididunt commodo consequat ex ipsum occaecat laborum veniam in labore ad. Quis irure culpa ipsum occaecat ad culpa eu eu sit anim minim anim officia. Excepteur dolor aliquip proident elit elit sint. Quis esse labore consequat occaecat sit consequat ipsum est proident qui aliquip elit. Id irure duis labore ad in. Non sint enim consequat irure pariatur.""",
          isFromUser: false),
    ];
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
