// ignore_for_file: use_key_in_widget_constructors, unused_element, prefer_const_constructors, sort_constructors_first, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:meals/models/category.dart'; 
import '../screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category);

  void _selectCategory(BuildContext context) {
    //coloca a proxima tela
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return CategoriesMealsScreen();
        },
      ),
    );
    /*   Navigator.of(context).pushNamed(
      AppRoutes.CATEGORIES_MEALS,
      arguments: category,
    ); */
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context), //quando o usuário preciona
      splashColor: Theme.of(context).primaryColor,
      borderRadius:
          BorderRadius.circular(15), // para o click não passar da margem
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
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
      ),
    );

    /* return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline6,
        ),
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
      ),
    ); */
  }
}
