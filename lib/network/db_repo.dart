import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food_prediction_app/features/model/category.dart';
import 'package:food_prediction_app/features/model/foods.dart';
import 'package:food_prediction_app/features/model/meal_rec.dart';
import 'package:food_prediction_app/network/db_ds.dart';
import 'package:food_prediction_app/network/fail.dart';
import 'package:food_prediction_app/util/mapper.dart';

abstract class DatabaseRepo {
  Future<Either<Failure, List<MealRecommendation>>> getMealRecommendation();
  Future<Either<Failure, (List<Foods>, List<Category>)>> getFoods();
}

class DatabaseRepoImpl implements DatabaseRepo {
  final DatabaseDatasource _databaseDatasource;
  DatabaseRepoImpl(this._databaseDatasource);

  @override
  Future<Either<Failure, List<MealRecommendation>>>
  getMealRecommendation() async {
    try {
      final response = await _databaseDatasource.getMealRecommendation();
      return right(
        response.map((data) => data.convertToMealRecModel()).toList(),
      );
    } on DioException catch (e) {
      return left(
        Failure(
          message: e.message ?? "Unknown error",
          code: e.response?.statusCode ?? 500,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, (List<Foods>, List<Category>)>> getFoods() async {
    try {
      final response = await _databaseDatasource.getFoodList();
      final foods = response.$1.map((data) => data.convertToFoods()).toList();
      final category =
          response.$1.map((data) => data.convertCategory()).toList();
      return right((foods, category));
    } on DioException catch (e) {
      return left(
        Failure(
          message: e.message ?? "Unknown error",
          code: e.response?.statusCode ?? 500,
        ),
      );
    }
  }
}
