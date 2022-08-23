import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Models/meals.dart';
import 'package:flutter_complete_guide/dummy_data.dart';
import '../Widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/categories-meals';
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData=false;

  void initState(){
    // final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    // final String categoryId= routeArgs['id'];
    // final String categoryTitle= routeArgs['title'];
    // displayedMeals = widget.availableMeals.where((meal) {
    //   return meal.categories.contains(categoryId);
    // }).toList();
    super.initState();
  }

  void _removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }
  //const CategoryMealsScreen({Key? key}) : super(key: key);


  void didChangeDependencies(){
    if(!_loadedInitData) {
      final routeArgs = ModalRoute
          .of(context)
          .settings
          .arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle),),
      body: ListView.builder(itemBuilder: (ctx, index){
        return MealItem(
          id: displayedMeals[index].id,
          title: displayedMeals[index].title,
          imageUrl: displayedMeals[index].imageUrl,
          duration: displayedMeals[index].duration,
          affordability: displayedMeals[index].affordability,
          complexity: displayedMeals[index].complexity,
          //removeItem: _removeMeal,
        );
      },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
