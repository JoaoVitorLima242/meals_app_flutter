import 'package:flutter/material.dart';
import 'package:meals_app/features/filters/widgets/filters_check_item.dart';
import 'package:meals_app/features/tab_bar/widgets/main_drawer.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreen();
  }
}

class _FiltersScreen extends State<FiltersScreen> {
  bool _gluttenFreeFilter = false;
  bool _lactoseFreeFilter = false;
  bool _vegetarianFilter = false;
  bool _veganFilter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      drawer: const MainDrawer(currentPage: DrawerRoutes.filters),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _gluttenFreeFilter,
            Filter.lactoseFree: _lactoseFreeFilter,
            Filter.vegetarian: _vegetarianFilter,
            Filter.vegan: _veganFilter,
          });

          return false;
        },
        child: Column(children: [
          FilterCheckItem(
            title: "Gluten-free",
            subtitle: "Only include gluten-free meals",
            value: _gluttenFreeFilter,
            onChanged: (isChecked) {
              setState(() {
                _gluttenFreeFilter = isChecked;
              });
            },
          ),
          FilterCheckItem(
            title: "Lactose-free",
            subtitle: "Only include lactose-free meals",
            value: _lactoseFreeFilter,
            onChanged: (isChecked) {
              setState(() {
                _lactoseFreeFilter = isChecked;
              });
            },
          ),
          FilterCheckItem(
            title: "Vegetarian",
            subtitle: "Only include vegetarian meals",
            value: _vegetarianFilter,
            onChanged: (isChecked) {
              setState(() {
                _vegetarianFilter = isChecked;
              });
            },
          ),
          FilterCheckItem(
            title: "Vegan",
            subtitle: "Only include vegan meals",
            value: _veganFilter,
            onChanged: (isChecked) {
              setState(() {
                _veganFilter = isChecked;
              });
            },
          ),
        ]),
      ),
    );
  }
}
