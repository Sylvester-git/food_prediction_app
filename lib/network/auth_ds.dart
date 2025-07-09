import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:food_prediction_app/util/storage.dart';

import 'api.dart';

abstract class AuthDs {
  Future<void> login({required String email, required String password});
  Future<void> signup({
    required String email,
    required String password,
    required List<String> likedFoods,
  });
}

class AuthDsImpl implements AuthDs {
  final Api _api = Api();
  final Storage _storage;

  AuthDsImpl({required Storage storage}) : _storage = storage;
  @override
  Future<void> login({required String email, required String password}) async {
    try {
      final dio = await _api.getDio();
      final response = await dio.post(
        "/login",
        data: {"email": email, "password": password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data["token"];
        if (data != null) {
          await _storage.saveToken(token: data);
        } else {
          throw Exception("Error logging in");
        }
      } else {
        throw Exception("Failed to login");
      }
    } on DioException catch (e, s) {
      log("Stacktrace $s");
      rethrow;
    }
  }

  @override
  Future<void> signup({
    required String email,
    required String password,
    required List<String> likedFoods,
  }) async {
    try {
      final dio = await _api.getDio();
      final response = await dio.post(
        "/signup",
        data: {
          "email": email,
          "password": password,
          "liked_food_ids": likedFoods,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return;
      } else {
        throw Exception("Failed to signup");
      }
    } on DioException catch (e, s) {
      log("Stacktrace $s");
      rethrow;
    }
  }
}
