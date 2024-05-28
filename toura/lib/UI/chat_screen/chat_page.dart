import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toura/UI/chat_screen/chat_box.dart';
import 'package:toura/UI/chat_screen/input_box.dart';

class Message {
  String content;
  bool isFromUser;

  Message({required this.content, required this.isFromUser});
}

class MsgNotifier extends Notifier<List<Message>> {
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

  void add(Message msg) {
    state = [...state, msg];
  }
}

final msgNotifierProvider = NotifierProvider<MsgNotifier, List<Message>>(() {
  return MsgNotifier();
});

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({super.key});

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  @override
  Widget build(BuildContext context) {
    var msgs = ref.watch(msgNotifierProvider).reversed.toList();

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              shrinkWrap: true,
              itemCount: msgs.length,
              itemBuilder: (context, index) {
                return ChatBox(
                    message: msgs[index].content,
                    isFromUser: msgs[index].isFromUser);
              },
            ),
          ),
          const InputBox(),
        ],
      ),
    );
  }
}
