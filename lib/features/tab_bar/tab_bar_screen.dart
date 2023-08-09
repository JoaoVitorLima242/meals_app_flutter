import 'package:flutter/material.dart';
import 'package:meals_app/features/categories/categories_screen.dart';
import 'package:meals_app/features/meals/meals_screen.dart';
import 'package:meals_app/features/tab_bar/widgets/bottom_tab_bar.dart';
import 'package:meals_app/models/meal.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() {
    return _TabBarScreen();
  }
}

class _TabBarScreen extends State<TabBarScreen> {
  final List<Meal> _favoritesMeals = [];
  int _selectedRageIndex = 0;

  void _toggleMealFavoriteStatues(Meal meal) {
    final isExisting = _favoritesMeals.contains(meal);

    if (isExisting) {
      _favoritesMeals.remove(meal);
      return;
    }

    _favoritesMeals.add(meal);
  }

  void _onSelectPage(int selectedIndex) {
    setState(() {
      _selectedRageIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onToggleFavorite: _toggleMealFavoriteStatues,
    );
    String? activePageTitle = 'Categoires';

    if (_selectedRageIndex == 1) {
      activePage = MealsScreen(
        meals: _favoritesMeals,
        onToggleFavorite: _toggleMealFavoriteStatues,
      );
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
