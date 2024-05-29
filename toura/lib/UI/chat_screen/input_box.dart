import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toura/UI/chat_screen/chat_page.dart';

class InputBox extends ConsumerStatefulWidget {
  const InputBox({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InputBoxState();
}

class _InputBoxState extends ConsumerState<InputBox> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 200),
        child: TextField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          controller: _controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            prefixIcon: const Icon(Icons.message),
            suffixIcon: IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                if (_controller.text.trim().isNotEmpty) {
                  ref.read(msgNotifierProvider.notifier).add(
                      Message(content: _controller.text, isFromUser: true));
                  _controller.clear();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
