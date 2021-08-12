// ignore_for_file: sort_constructors_first, unused_field, unused_element, always_declare_return_types

import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorite_screen.dart';
import '../components/main_drawer.dart';

//controla a navegação com abas
class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  late List<Map<String, dynamic>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Lista de categorias',
        'screen': CategoriesScreen(),
      },
      {
        'title': 'Meus favoritos',
        'screen': FavoriteScreen(widget.favoriteMeals)
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title']),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      //Icone de navegação
      drawer: MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
            // backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
            //  backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedScreenIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.amberAccent[100],
        iconSize: 30,
        onTap: _selectScreen,
        //type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
