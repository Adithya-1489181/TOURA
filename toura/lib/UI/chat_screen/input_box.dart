import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toura/Provider/messagenotifier.dart';

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
              onPressed: () async {
                if (_controller.text.trim().isNotEmpty) {
                  String prompt = _controller.text;
                  _controller.clear();
                  if (!await ref
                      .read(msgNotifierProvider.notifier)
                      .add(prompt)) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            "Something went wrong. Please try again shortly"),
                      ));
                    }
                  }
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
