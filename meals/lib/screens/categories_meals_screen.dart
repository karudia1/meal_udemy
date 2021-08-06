// ignore_for_file: sort_constructors_first

import 'package:flutter/material.dart';

class CategoriesMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receitas'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Text('Receitas por categoria'),
      ),
    );

    /* final List<Meal> meals;

  const CategoriesMealsScreen(this.meals);
  
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(categoryMeals[index]);
        },
      ),
    ); */
  }
}
