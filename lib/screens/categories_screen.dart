import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../Widgets/category_items.dart';

class CategoriesScreen extends StatelessWidget {
  // const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES.map(
                (catData) => CategoryItem(
              catData.id,
              catData.title,
              catData.color,
            )
        ).toList(),
      );
  }
}
