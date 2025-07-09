import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food_prediction_app/network/auth_ds.dart';
import 'package:food_prediction_app/network/fail.dart' show Failure;

abstract class AuthRepo {
  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> signup({
    required String email,
    required String password,
    required List<String> likedFoods,
  });
}

class AuthRepoImpl implements AuthRepo {
  final AuthDs _authDs;

  AuthRepoImpl({required AuthDs authDs}) : _authDs = authDs;
  @override
  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  }) async {
    try {
      final res = await _authDs.login(email: email, password: password);
      return right(res);
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
  Future<Either<Failure, void>> signup({
    required String email,
    required String password,
    required List<String> likedFoods,
  }) async {
    try {
      final res = await _authDs.signup(
        email: email,
        password: password,
        likedFoods: likedFoods,
      );
      return right(res);
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
