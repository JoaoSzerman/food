import 'package:flutter/material.dart';
import 'package:food/screens/categories_meals_screen.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      '/categories-meals',
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}