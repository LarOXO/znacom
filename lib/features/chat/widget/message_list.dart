import 'package:flutter/material.dart';
import 'package:znacom/features/chat/chat.dart';

class MessageList extends StatelessWidget {
  final List<Message> messages;

  const MessageList({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return messages.isEmpty
        ? _buildEmptyChatMessage()
        : ListView.builder(
            reverse: true,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[messages.length - 1 - index];
              return _buildMessageBubble(message);
            },
          );
  }

  Widget _buildEmptyChatMessage() {
    return const Padding(
      padding: EdgeInsets.only(top: 50),
      child: Text(
        'Начни общение',
        style: TextStyle(color: Colors.white54, fontSize: 12),
      ),
    );
  }

  Widget _buildMessageBubble(Message message) {
    return Align(
      alignment:
          message.isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: message.isSentByMe ? Colors.blue : Colors.grey[800],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft:
                message.isSentByMe ? const Radius.circular(12) : Radius.zero,
            bottomRight:
                message.isSentByMe ? Radius.zero : const Radius.circular(12),
          ),
        ),
        child: Text(
          message.text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
