import 'package:flutter/material.dart';

class BottomTabBar extends StatelessWidget {
  const BottomTabBar({
    super.key,
    required this.onSelectPage,
    required this.currentIndexPage,
  });

  final void Function(int selectedIndex) onSelectPage;
  final int currentIndexPage;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndexPage,
      onTap: onSelectPage,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.set_meal),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          label: 'Favorites',
        ),
      ],
    );
  }
}
