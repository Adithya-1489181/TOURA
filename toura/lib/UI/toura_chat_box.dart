import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ChatBox extends StatelessWidget {
  final String message;
  final bool isFromUser;

  const ChatBox({super.key, required this.message, required this.isFromUser});

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(16.0);
    return Row(
      mainAxisAlignment:
          isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80),
            decoration: BoxDecoration(
              color: isFromUser
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.surfaceContainer,
              borderRadius: isFromUser
                  ? const BorderRadius.only(
                      topLeft: radius, topRight: radius, bottomLeft: radius)
                  : const BorderRadius.only(
                      topLeft: radius, topRight: radius, bottomRight: radius),
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
            margin: const EdgeInsets.only(bottom: 8.0),
            child: MarkdownBody(
              data: message,
              selectable: true,
            ),
          ),
        ),
      ],
    );
  }
}
