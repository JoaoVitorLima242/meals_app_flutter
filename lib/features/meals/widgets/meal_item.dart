import 'package:flutter/material.dart';
import 'package:meals_app/common_widgets/TextWithIcon.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meals_app/models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.onSelectMeal,
  });

  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => onSelectMeal(meal),
        child: Stack(
          children: [
            FadeInImage(
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 24,
                ),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextWithIcon(
                          icon: Icons.schedule,
                          label: '${meal.duration} min',
                        ),
                        TextWithIcon(
                          icon: Icons.work,
                          label: complexityText,
                        ),
                        TextWithIcon(
                          icon: Icons.attach_money,
                          label: affordabilityText,
                        ),
                      ],
                    ) // We can put this row inside a Row because Positioned have a width limit
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}