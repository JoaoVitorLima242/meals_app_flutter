import 'package:flutter/material.dart';
import 'package:meals_app/features/tab_bar/widgets/drawer_list_item.dart';

enum DrawerRoutes { filters, meals }

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(DrawerRoutes identifier) onSelectScreen;

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
            onSelectScreen(DrawerRoutes.meals);
          },
          icon: Icons.restaurant,
          title: "meals",
        ),
        DrawerListItem(
          onTap: () {
            onSelectScreen(DrawerRoutes.filters);
          },
          icon: Icons.settings,
          title: "Filters",
        ),
      ]),
    );
  }
}
