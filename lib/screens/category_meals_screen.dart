import 'package:flutter/material.dart';
import 'package:meals_app/complex-widgets/meal_item.dart';
import 'package:meals_app/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  // final String routeName = '/category-meals'; this dosent't work as we cannot access final properties without instantiating the class, but we can use static const properties
  static const String routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'].toString();
    final categoryMealsList = DUMMY_MEALS.where(
      (meal) {
        return meal.categories.contains(categoryId);
      },
    ).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title: categoryMealsList[index].title,
            imageUrl: categoryMealsList[index].imageUrl,
            duration: categoryMealsList[index].duration,
            affordability: categoryMealsList[index].affordability,
            complexity: categoryMealsList[index].complexity,
          );
        },
        itemCount: categoryMealsList.length,
      ),
    );
  }
}
