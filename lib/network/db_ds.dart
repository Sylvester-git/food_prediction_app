import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:food_prediction_app/network/api.dart';

abstract class DatabaseDatasource {
  Future<List<Map<String, dynamic>>> getMealRecommendation();
  Future<(List<Map<String, dynamic>>, List<Map<String, dynamic>>)>
  getFoodList();
}

class DatabaseDatasourceImpl implements DatabaseDatasource {
  // ignore: non_constant_identifier_names
  final Api _Api = Api();

  @override
  Future<List<Map<String, dynamic>>> getMealRecommendation() async {
    try {
      final dio = await _Api.getDio();
      final response = await dio.get('/recommend');
      if (response.statusCode == 200) {
        final data = response.data['recommendations'];
        if (data != null) {
          return (data as List).cast<Map<String, dynamic>>();
        } else {
          throw Exception("No rcommendations found");
        }
      } else {
        throw Exception("Failed to fetch recommendations");
      }
    } on DioException catch (e, s) {
      log("Stacktrace $s");
      rethrow;
    }
  }

  @override
  Future<(List<Map<String, dynamic>>, List<Map<String, dynamic>>)>
  getFoodList() async {
    try {
      final dio = await _Api.getDio();
      final res = await dio.get("/foods");
      if (res.statusCode == 200) {
        final fooddata =
            (res.data['foods'] as List).cast<Map<String, dynamic>>();
        final categorydata =
            (res.data['categories'] as List).cast<Map<String, dynamic>>();
        return (fooddata, categorydata);
      } else {
        throw Exception("Failed to fetch foods");
      }
    } on DioException catch (e, s) {
      log("Stacktrace $s");
      rethrow;
    }
  }
}
