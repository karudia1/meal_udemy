// ignore_for_file: omit_local_variable_types

import 'package:flutter/material.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';

import 'data/dummy_data.dart';
import 'models/meal.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/tabs_screen.dart';
import 'utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  //Não coloca final, pois vai ficar alterando a referência
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filteGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filteGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  //Alterna a seleção de comida favoritas
  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isfavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primaryColor: Colors.pink,
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: Colors.amber,
            ),
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
                subtitle1: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
            )),
      ),
      //home: CategoriesScreen(),

      routes: {
        //substituiu a CategoriesScreen:
        //AppRoutes.HOME: (ctx) => CategoriesScreen(),
        AppRoutes.HOME: (ctx) => TabsScreen(_favoriteMeals),
        //Passagem de parametro para CategoriesMealsScreen
        AppRoutes.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreen(_availableMeals),
        // colocada uma função para passar a comida favorita
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(_toggleFavorite, _isfavorite),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(settings, _filterMeals),
      },
      //exemplo de criação de rota dinâmica
      /* onGenerateRoute: (settings) {
        if (settings.name == '/aluma-coisa') {
          return null;
        } else if (settings.name == 'outra-coisa') {
          return null;
        } else {
          return MaterialPageRoute(
            builder: (_) {
              return CategoriesScreen();
            },
          );
        }
      }, */
      //Quando a rota é desconhecida (gera uma mensagem de erro, tipo 404)
      onUnknownRoute: (setting) {
        return MaterialPageRoute(
          builder: (_) {
            return CategoriesScreen();
          },
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navegar é preciso!!'),
      ),
    );
  }
}
