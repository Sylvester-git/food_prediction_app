import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:food_prediction_app/network/api.dart';

abstract class DatabaseDatasource {
  Future<Map<String, dynamic>> getMealRecommendation({required int userID});
}

class DatabaseDatasourceImpl implements DatabaseDatasource {
  // ignore: non_constant_identifier_names
  final Api _Api = Api();

  @override
  Future<Map<String, dynamic>> getMealRecommendation({
    required int userID,
  }) async {
    try {
      final dio = await _Api.getDio();
      final response = await dio.get('/recommend/$userID');
      if (response.statusCode == 200) {
        final data = response.data['recommendations'];
        if (data != null) {
          return data;
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
}
