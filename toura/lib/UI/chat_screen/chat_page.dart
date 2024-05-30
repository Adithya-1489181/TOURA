import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toura/Provider/messagenotifier.dart';
import 'package:toura/UI/chat_screen/chat_box.dart';
import 'package:toura/UI/chat_screen/input_box.dart';

// TODO: Look at  Flutter Chat UI

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({super.key});

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  late ScrollController _scrollController;
  bool isAttached = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var msgs = ref.watch(msgNotifierProvider).reversed.toList();
    if (msgs.isNotEmpty) {
      _scrollController.animateTo(0,
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    }
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
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
          if (ref.read(msgNotifierProvider.notifier).isAITyping)
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 4),
              child: Align(
                  alignment: Alignment.centerLeft, child: Text("Typing...")),
            ),
          const InputBox(),
        ],
      ),
    );
  }
}
