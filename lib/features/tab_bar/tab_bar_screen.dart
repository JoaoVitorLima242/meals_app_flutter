import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/features/categories/categories_screen.dart';
import 'package:meals_app/features/meals/meals_screen.dart';
import 'package:meals_app/features/tab_bar/widgets/bottom_tab_bar.dart';
import 'package:meals_app/features/tab_bar/widgets/main_drawer.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/meals_provider.dart';

class TabBarScreen extends ConsumerStatefulWidget {
  const TabBarScreen({super.key});

  @override
  ConsumerState<TabBarScreen> createState() {
    return _TabBarScreen();
  }
}

class _TabBarScreen extends ConsumerState<TabBarScreen> {
  final List<Meal> _favoritesMeals = [];
  int _selectedRageIndex = 0;

  void _showFeedbackMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _toggleMealFavoriteStatues(Meal meal) {
    final isExisting = _favoritesMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favoritesMeals.remove(meal);
      });
      _showFeedbackMessage('Meal removed!');
      return;
    }

    setState(() {
      _favoritesMeals.add(meal);
    });
    _showFeedbackMessage('Marked as a favorite!');
  }

  void _onSelectPage(int selectedIndex) {
    setState(() {
      _selectedRageIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);

    print(meals);

    Widget activePage = CategoriesScreen(
      onToggleFavorite: _toggleMealFavoriteStatues,
    );
    String? activePageTitle = 'Categories';

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
      drawer: const MainDrawer(
        currentPage: DrawerRoutes.meals,
      ),
      bottomNavigationBar: BottomTabBar(
        currentIndexPage: _selectedRageIndex,
        onSelectPage: _onSelectPage,
      ),
    );
  }
}
