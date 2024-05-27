import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toura/UI/toura_chat_box.dart';

class Message {
  String content;
  bool isFromUser;

  Message({required this.content, required this.isFromUser});
}

List<Message> msgs = <Message>[
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

final messageProvider = Provider<List<Message>>(
  (ref) {
    return msgs;
  },
);

class ChatPage extends ConsumerWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var msgs = ref.watch(messageProvider).reversed.toList();

    return Column(
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
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              prefixIcon: const Icon(Icons.message),
              suffixIcon: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
