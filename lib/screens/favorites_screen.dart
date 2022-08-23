import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Models/meals.dart';
import 'package:flutter_complete_guide/Widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  //const FavoritesScreen({Key? key}) : super(key: key);
  final List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text(
          'You have no favorites\n start adding some',
          style: TextStyle(fontSize: 24,),textAlign: TextAlign.center,
        ),
      );
    }else{
      return ListView.builder(itemBuilder: (ctx, index){
    return MealItem(
    id: favoriteMeals[index].id,
    title: favoriteMeals[index].title,
    imageUrl: favoriteMeals[index].imageUrl,
    duration: favoriteMeals[index].duration,
    affordability: favoriteMeals[index].affordability,
    complexity: favoriteMeals[index].complexity,
    );
    },
    itemCount: favoriteMeals.length,
    );
    }
  }
}
