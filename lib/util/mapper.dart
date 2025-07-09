import 'package:food_prediction_app/features/model/category.dart';
import 'package:food_prediction_app/features/model/foods.dart';
import 'package:food_prediction_app/features/model/meal_rec.dart';

extension ConvertToMealRecModel on Map<String, dynamic> {
  MealRecommendation convertToMealRecModel() {
    return MealRecommendation(items: this['Items'], type: this['type']);
  }
}

extension ConvertFoods on Map<String, dynamic> {
  Foods convertToFoods() {
    return Foods(
      id: this['id'],
      name: this['name'],
      catid: this['category_id'],
    );
  }
}

extension ConvertCategories on Map<String, dynamic> {
  Category convertCategory() {
    return Category(id: this['id'], name: this['name']);
  }
}
