import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  //const MealDetailScreen({Key? key}) : super(key: key);

  static const routeName='/meal-detail';
  final Function toggleFavorite;
  final Function isFavorite;
  MealDetailScreen(this.toggleFavorite,this.isFavorite);

  Widget buildSectionTitle(BuildContext context,String text){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer({Widget child}){
    return  Container(
        decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
    borderRadius: BorderRadius.circular(10),
    ),
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    height: 200,
    width: double.infinity,
    child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId= ModalRoute.of(context).settings.arguments as String;
    final selectedMeal= DUMMY_MEALS.firstWhere((meal) => meal.id==mealId);
    return Scaffold(
      appBar: AppBar(title: Text('${selectedMeal.title}'),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,),
            ),
            buildSectionTitle(context, 'Ingredients Used:'),

              buildContainer(
                child: ListView.builder(
                  itemBuilder: (ctx, index)=> Card(
                    color: Theme.of(context).accentColor.withOpacity(0.7),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10),
                        child: Text(
                          selectedMeal.ingredients[index],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,),
                        ),
                      ),
                    ),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),

            buildSectionTitle(context, 'Steps:'),

            buildContainer(
              child: ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (ctx, index)=> Column(
                      children: <Widget>[ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index+1}'),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                        Divider()
                      ],
              )
              )
            )
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(
          child: isFavorite(mealId) ? Icon(Icons.star) : Icon(Icons.star_border),
          onPressed: ()=>toggleFavorite(mealId),
        ),
    );
  }
}
