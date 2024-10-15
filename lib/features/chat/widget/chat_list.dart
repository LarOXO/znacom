import 'package:flutter/material.dart';
import 'package:znacom/features/chat/chat.dart';

class ChatList extends StatelessWidget {
  final ScrollController scrollController;

  const ChatList({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: 25,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () => _showChatUserModal(context),
          title: const Text(
            '23 ч 43 мин',
            style: TextStyle(fontSize: 12),
          ),
          subtitle: const Text(
            'Отлично выглядишь',
            style: TextStyle(fontSize: 14),
          ),
          leading: const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/profile.jpeg'),
          ),
          trailing: const Icon(
            Icons.circle,
            size: 4,
          ),
        );
      },
    );
  }

  void _showChatUserModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return const FractionallySizedBox(
          heightFactor: 0.75,
          child: ChatUser(),
        );
      },
    );
  }
}
