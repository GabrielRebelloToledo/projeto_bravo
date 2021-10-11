import 'package:bravo/core/models/chat_message.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;
  final bool belongsToCurrentUser;

  const MessageBubble(
      {Key? key, required this.message, required this.belongsToCurrentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: belongsToCurrentUser
            ? Colors.grey.shade300
            : Theme.of(context).accentColor,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Text(message.text),
    );
  }
}
