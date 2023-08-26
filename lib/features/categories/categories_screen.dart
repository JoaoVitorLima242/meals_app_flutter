import 'package:flutter/material.dart';
import 'package:meals_app/features/categories/widgets/categories_screen_content.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() {
    return _CategoriesScreen();
  }
}

class _CategoriesScreen extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController
      _animationController; // With late the component will only be execute when the initial state is executed. Not in the class creation.

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => SlideTransition(
        position: Tween(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        ),
        child: child,
      ),
      child: const CategoriesScreenContent(),
    );
  }
}
