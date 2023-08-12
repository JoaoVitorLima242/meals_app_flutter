import 'package:flutter/material.dart';
import 'package:meals_app/features/filters/widgets/filters_check_item.dart';
import 'package:meals_app/features/tab_bar/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreen();
  }
}

class _FiltersScreen extends State<FiltersScreen> {
  bool _gluttenFreeFilterSet = false;
  bool _lactoseFreeFilterSet = false;
  bool _vegetarianFilterSet = false;
  bool _veganFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      drawer: const MainDrawer(currentPage: DrawerRoutes.filters),
      body: Column(children: [
        FilterCheckItem(
          title: "Gluten-free",
          subtitle: "Only include gluten-free meals",
          value: _gluttenFreeFilterSet,
          onChanged: (isChecked) {
            setState(() {
              _gluttenFreeFilterSet = isChecked;
            });
          },
        ),
        FilterCheckItem(
          title: "Lactose-free",
          subtitle: "Only include lactose-free meals",
          value: _lactoseFreeFilterSet,
          onChanged: (isChecked) {
            setState(() {
              _lactoseFreeFilterSet = isChecked;
            });
          },
        ),
        FilterCheckItem(
          title: "Vegetarian",
          subtitle: "Only include vegetarian meals",
          value: _vegetarianFilterSet,
          onChanged: (isChecked) {
            setState(() {
              _vegetarianFilterSet = isChecked;
            });
          },
        ),
        FilterCheckItem(
          title: "Vegan",
          subtitle: "Only include vegan meals",
          value: _veganFilterSet,
          onChanged: (isChecked) {
            setState(() {
              _veganFilterSet = isChecked;
            });
          },
        ),
      ]),
    );
  }
}
