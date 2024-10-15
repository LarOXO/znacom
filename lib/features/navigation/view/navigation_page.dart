import 'package:flutter/material.dart';
import 'package:znacom/features/chat/chat.dart';
import 'package:znacom/features/navigation/navigation.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;

  final List<NavItem> _navItems = [
    NavItem(icon: 'assets/icon/main.svg', widget: const Placeholder()),
    NavItem(icon: 'assets/icon/chat.svg', widget: const ChatPage()),
    NavItem(icon: 'assets/icon/favorite.svg', widget: const Placeholder()),
    NavItem(icon: 'assets/icon/settings.svg', widget: const Placeholder()),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: _navItems[_currentIndex].widget,
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: _navItems,
      ),
    );
  }
}
