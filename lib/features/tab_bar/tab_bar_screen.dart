import 'package:flutter/material.dart';
import 'package:meals_app/features/categories/categories_screen.dart';
import 'package:meals_app/features/meals/meals_screen.dart';
import 'package:meals_app/features/tab_bar/widgets/bottom_tab_bar.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() {
    return _TabBarScreen();
  }
}

class _TabBarScreen extends State<TabBarScreen> {
  int _selectedRageIndex = 0;

  void _onSelectPage(int selectedIndex) {
    setState(() {
      _selectedRageIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const CategoriesScreen();
    String? activePageTitle = 'Categoires';

    if (_selectedRageIndex == 1) {
      activePage = const MealsScreen(meals: []);
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomTabBar(
        currentIndexPage: _selectedRageIndex,
        onSelectPage: _onSelectPage,
      ),
    );
  }
}
