import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toura/Provider/messagenotifier.dart';

class InputBox extends ConsumerStatefulWidget {
  final ScrollController scrollController;
  const InputBox({super.key, required this.scrollController});

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
          minLines: 1,
          maxLines: 5,
          controller: _controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            prefixIcon: const Icon(Icons.message),
            suffixIcon: IconButton(
              icon: const Icon(Icons.send),
              onPressed: () async {
                if (_controller.text.trim().isNotEmpty &&
                    !ref.read(msgNotifierProvider.notifier).isAITyping) {
                  String prompt = _controller.text;
                  _controller.clear();
                  ref.read(msgNotifierProvider.notifier).userPrompt(prompt);
                  widget.scrollController.animateTo(0,
                      duration: const Duration(microseconds: 500),
                      curve: Curves.easeIn);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
