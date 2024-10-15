import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:znacom/features/navigation/navigation.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<NavItem> items;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.purple,
      backgroundColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: currentIndex,
      onTap: onTap,
      items: items.map((item) => _buildNavItem(item)).toList(),
    );
  }

  BottomNavigationBarItem _buildNavItem(NavItem item) {
    return BottomNavigationBarItem(
      label: '',
      icon: SvgPicture.asset(
        item.icon,
        colorFilter: ColorFilter.mode(
          currentIndex == items.indexOf(item) ? Colors.amber : Colors.purple,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}