import 'package:flutter/material.dart';
import 'package:znacom/features/chat/chat.dart';

class ChatUser extends StatefulWidget {
  const ChatUser({super.key});

  @override
  State<ChatUser> createState() => _ChatUserState();
}

class _ChatUserState extends State<ChatUser> {
  final List<Message> _messages = [];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage(String text) {
    if (text.isNotEmpty) {
      setState(() {
        _messages.add(Message(text: text, isSentByMe: true));
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            children: [
              Expanded(
                child: MessageList(messages: _messages),
              ),
              MessageInput(
                controller: _controller,
                onSend: _sendMessage,
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ],
    );
  }
}
