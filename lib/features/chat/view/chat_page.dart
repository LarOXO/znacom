import 'package:flutter/material.dart';
import 'package:znacom/features/chat/chat.dart';
import 'package:znacom/features/subscription/subscription.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool _isSwitchOn = true;

  void _toggleSwitch() {
    setState(() {
      _isSwitchOn = !_isSwitchOn;
    });
    _showSubscriptionModal();
  }

  void _showSubscriptionModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return const FractionallySizedBox(
          heightFactor: 0.50,
          child: Subscription(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ChatCarousel(),
          DraggableScrollableSheet(
            snap: true,
            initialChildSize: 0.75,
            minChildSize: 0.75,
            maxChildSize: 1,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                child: Column(
                  children: [
                    _buildHeader(),
                    _buildLikedUsersSection(),
                    Expanded(
                      child: ChatList(scrollController: scrollController),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('ЧАТЫ', style: TextStyle(fontSize: 24)),
          Row(
            children: [
              Text(
                _isSwitchOn ? 'ON' : 'OFF',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: _toggleSwitch,
                child: Container(
                  width: 50,
                  height: 30,
                  decoration: BoxDecoration(
                    color: _isSwitchOn ? Colors.green : Colors.grey,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Image.asset('assets/icon/glass.png'),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildLikedUsersSection() {
    return GestureDetector(
      onTap: () {},
      child: ListTile(
        title: const Text(
          '44 человека тебя лайкнули',
          style: TextStyle(fontSize: 14),
        ),
        leading: ClipOval(
          child: Container(
            color: Colors.purple[900],
            width: 55,
            height: 55,
            child: const Icon(
              Icons.favorite,
              color: Colors.purple,
              size: 30,
            ),
          ),
        ),
        trailing: const Icon(
          Icons.circle,
          size: 4,
        ),
      ),
    );
  }
}
