import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorites_provider.dart';

class FavoriteButton extends ConsumerWidget {
  const FavoriteButton({super.key, required this.meal});

  final Meal meal;

  void onToggleFavorite(
    BuildContext context,
    WidgetRef ref,
  ) {
    final toggleMessage = ref
        .read(favoritesMealsProvider.notifier)
        .toggleMealFavoritessStatus(meal);

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(toggleMessage),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoritesMealsProvider);

    final isFavorite = favoriteMeals.contains(meal);

    return IconButton(
      onPressed: () => onToggleFavorite(context, ref),
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return RotationTransition(
            turns: Tween<double>(
              begin: 0,
              end: 10,
            ).animate(animation),
            child: child,
          );
        },
        child: Icon(
          key: ValueKey(isFavorite),
          isFavorite ? Icons.star : Icons.star_border_outlined,
        ),
      ),
    );
  }
}
