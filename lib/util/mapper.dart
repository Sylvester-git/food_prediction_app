import 'package:food_prediction_app/features/model/meal_rec.dart';

extension ConvertToMealRecModel on Map<String, dynamic> {
  MealRecommedationModle convertToMealRecModel() {
    return MealRecommedationModle(
      mptfd: this['mpfd'],
      mps: this['mps'],
      mptm: this['mpfm'],
      mpsw: this['mpsw'],
      mpdk: this['mpdk'],
      mpft: this['mpft'],
    );
  }
}
