import 'package:flutter/material.dart';
import 'package:meals_app/complex-widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyMeals"),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          ...DUMMY_CATEGORIES.map((category) {
            return CategoryItem(category.id ,category.title, category.color);
          }).toList(),
        ],
        padding: EdgeInsets.all(25),
      ),
  
    );
  }
}
