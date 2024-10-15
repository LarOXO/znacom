import 'package:flutter/material.dart';

class MessageInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSend;

  const MessageInput({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => onSend(controller.text),
            child: const Icon(Icons.add, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(color: Colors.white),
              maxLines: 4,
              minLines: 1,
              decoration: InputDecoration(
                suffixIcon: Image.asset('assets/photo.png'),
                filled: true,
                fillColor: Colors.grey[800],
                hintText: 'Введите сообщение...',
                hintStyle: const TextStyle(color: Colors.white54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () => onSend(controller.text),
            child: const Icon(Icons.mic_none, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
