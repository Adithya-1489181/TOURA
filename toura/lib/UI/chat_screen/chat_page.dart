import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toura/Provider/messagenotifier.dart';
import 'package:toura/UI/chat_screen/chat_box.dart';
import 'package:toura/UI/chat_screen/input_box.dart';

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
