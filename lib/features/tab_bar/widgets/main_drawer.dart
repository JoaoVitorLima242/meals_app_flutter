import 'package:flutter/material.dart';
import 'package:meals_app/features/filters/filters_screen.dart';
import 'package:meals_app/features/tab_bar/tab_bar_screen.dart';
import 'package:meals_app/features/tab_bar/widgets/drawer_list_item.dart';

enum DrawerRoutes { filters, meals }

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.currentPage});

  final DrawerRoutes currentPage;

  void _setScreen(BuildContext context, DrawerRoutes identifier) {
    Navigator.of(context).pop();
    switch (identifier) {
      case DrawerRoutes.meals:
        if (currentPage == DrawerRoutes.filters) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => const TabBarScreen()),
          );
        }
        break;
      case DrawerRoutes.filters:
        if (currentPage == DrawerRoutes.meals) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => const FiltersScreen()),
          );
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.fastfood,
                size: 48,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 18),
              Text(
                'Cooking Up!',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              )
            ],
          ),
        ),
        DrawerListItem(
          onTap: () {
            _setScreen(context, DrawerRoutes.meals);
          },
          icon: Icons.restaurant,
          title: "Meals",
        ),
        DrawerListItem(
          onTap: () {
            _setScreen(context, DrawerRoutes.filters);
          },
          icon: Icons.settings,
          title: "Filters",
        ),
      ]),
    );
  }
}
