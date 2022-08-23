import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Models/meals.dart';
import 'package:flutter_complete_guide/Widgets/main_drawer.dart';
import 'package:flutter_complete_guide/screens/categories_screen.dart';
import 'package:flutter_complete_guide/screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  //const TabsScreen({Key? key}) : super(key: key);

  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  List<Map<String, Object>> _pages;


  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(widget.favoriteMeals), 'title': 'Favorites'},
    ];
    super.initState();
  }
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        // initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            title: Text(_pages[_selectedPageIndex]['title']),
          //   bottom: TabBar(                   (for nav tabs on app bar)
          //     tabs: <Widget>[
          //       Tab(icon: Icon(Icons.category),
          //         text: 'Categories', ),
          //       Tab(icon: Icon(Icons.star),
          //         text: 'favorites',),
          //     ],
          // ),
          ),
          // body: TabBarView(children: <Widget>[
          //  CategoriesScreen(),
          //   FavoritesScreen(),
          //],
          drawer: Drawer(child: MainDrawer(),),
          body: _pages[_selectedPageIndex]['page'],
          bottomNavigationBar: BottomNavigationBar(
            onTap: _selectPage,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Theme.of(context).accentColor,
            selectedItemColor: Theme.of(context).accentColor,
            currentIndex: _selectedPageIndex,
            // type: BottomNavigationBarType.shifting,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.category),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.star),
                label: 'Favorites',
              )
            ],
          ),
          ),
        );
  }
}
