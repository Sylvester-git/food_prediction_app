import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food_prediction_app/features/model/meal_rec.dart';
import 'package:food_prediction_app/network/db_ds.dart';
import 'package:food_prediction_app/network/fail.dart';
import 'package:food_prediction_app/util/mapper.dart';

abstract class DatabaseRepo {
  Future<Either<Failure, MealRecommedationModle>> getMealRecommendation({
    required int userID,
  });
}

class DatabaseRepoImpl implements DatabaseRepo {
  final DatabaseDatasource _databaseDatasource;
  DatabaseRepoImpl(this._databaseDatasource);

  @override
  Future<Either<Failure, MealRecommedationModle>> getMealRecommendation({
    required int userID,
  }) async {
    try {
      final response = await _databaseDatasource.getMealRecommendation(
        userID: userID,
      );
      return right(response.convertToMealRecModel());
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
