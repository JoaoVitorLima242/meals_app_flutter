import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/features/categories/categories_screen.dart';
import 'package:meals_app/features/meals/meals_screen.dart';
import 'package:meals_app/features/tab_bar/widgets/bottom_tab_bar.dart';
import 'package:meals_app/features/tab_bar/widgets/main_drawer.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/providers/filter_provider.dart';

class TabBarScreen extends ConsumerStatefulWidget {
  const TabBarScreen({super.key});

  @override
  ConsumerState<TabBarScreen> createState() {
    return _TabBarScreen();
  }
}

class _TabBarScreen extends ConsumerState<TabBarScreen> {
  int _selectedRageIndex = 0;

  void _onSelectPage(int selectedIndex) {
    setState(() {
      _selectedRageIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedFilters = ref.watch(filterProvider);
    final availableMeals = formatAvailableMeals(selectedFilters);
    print(availableMeals);

    Widget activePage = CategoriesScreen(
      meals: availableMeals,
    );
    String? activePageTitle = 'Categories';

    if (_selectedRageIndex == 1) {
      final favoriteMeals = ref.watch(favoritesMealsProvider);

      activePage = MealsScreen(
        meals: favoriteMeals,
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
