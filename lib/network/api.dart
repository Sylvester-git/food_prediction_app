import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:food_prediction_app/config/config.dart';
import 'package:food_prediction_app/util/storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Api {
  late Dio dio;
  Future<Dio> getDio() async {
    Dio dio = Dio();
    int timeout = 120;
    Map<String, dynamic> headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "platform": Platform.isAndroid ? "android" : "ios",
      "language": "en",
    };
    dio.options = BaseOptions(
      connectTimeout: Duration(seconds: timeout),
      receiveTimeout: Duration(seconds: timeout),
      headers: headers,
      baseUrl: ConfigServices.get('BASE_URL'),
    );
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ),
    );
    dio.interceptors.addAll({AppInterceptors(dio: dio)});
    return dio;
  }
}

class AppInterceptors extends Interceptor {
  final Dio dio;
  String? token;
  final storage = StorageImpl();

  AppInterceptors({required this.dio});
  // @override
  // void onError(DioException err, ErrorInterceptorHandler handler) {
  //   if (kDebugMode) {
  //     debugPrint(err.response?.statusMessage.toString());
  //     debugPrint(err.response?.statusCode.toString());
  //     debugPrint(err.response?.toString());
  //   }

  //   switch (err.type) {
  //     case DioExceptionType.connectionTimeout:
  //       throw ConnectTimeoutException(err.requestOptions);
  //     case DioExceptionType.sendTimeout:
  //       throw ConnectTimeoutException(err.requestOptions);
  //     case DioExceptionType.receiveTimeout:
  //       throw DeadlineExceededException(err.requestOptions);
  //     case DioExceptionType.badResponse:
  //       switch (err.response?.statusCode) {
  //         case 400:
  //           throw BadRequestException(
  //               res: err.response, requestOptions: err.requestOptions);
  //         case 401:
  //           throw UnauthorizedException(
  //               res: err.response, requestOptions: err.requestOptions);
  //         case 403:
  //           throw NotVerifiedException(
  //               res: err.response, requestOptions: err.requestOptions);
  //         case 404:
  //           throw NotFoundException(
  //               res: err.response, requestOptions: err.requestOptions);
  //         case 409:
  //           throw ConflictException(
  //               res: err.response, requestOptions: err.requestOptions);
  //         case 422:
  //           throw UnprocessableException(
  //               res: err.response, requestOptions: err.requestOptions);
  //         case 500:
  //           throw InternalServerErrorException(
  //               res: err.response, requestOptions: err.requestOptions);
  //         case 502:
  //           throw InternalServerErrorException(
  //               res: err.response, requestOptions: err.requestOptions);
  //         default:
  //           throw UnknownException(
  //               res: err.response, requestOptions: err.requestOptions);
  //       }
  //     case DioExceptionType.cancel:
  //       break;
  //     case DioExceptionType.unknown:
  //       throw NoInternetConnectionException(err.requestOptions);
  //     case DioExceptionType.badCertificate:
  //       throw InternalServerErrorException(
  //           res: err.response, requestOptions: err.requestOptions);
  //     case DioExceptionType.connectionError:
  //       throw ConnectTimeoutException(err.requestOptions);
  //   }
  //   return handler.next(err);
  // }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    token = await storage.getToken();
    if (token != null && token != "") {
      options.headers.addAll({'Authorization': "Bearer $token"});
    }

    debugPrint("Header :::: ${options.headers}");
    debugPrint("Data :::: ${options.data}");
    debugPrint("query params ${options.queryParameters}");
    debugPrint(options.path);
    debugPrint(options.baseUrl);

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(response.statusCode.toString());
    debugPrint(response.data.toString());
    return handler.next(response);
  }
}

// class NoInternetConnectionException extends DioException {
//   NoInternetConnectionException(RequestOptions requestOptions)
//       : super(requestOptions: requestOptions);

//   @override
//   String toString() {
//     return 'The connection to the internet has been lost.\nPlease try again';
//   }
// }

// class UnknownException extends DioException {
//   Response? res;

//   UnknownException({this.res, required super.requestOptions})
//       : super(response: res);
//   @override
//   String toString() {
//     return res?.data?['message'].toString() ??
//         res?.data?['error'].toString() ??
//         'Something went wrong.\nPlease try again.';
//   }
// }

// class InternalServerErrorException extends DioException {
//   Response? res;

//   InternalServerErrorException({this.res, required super.requestOptions})
//       : super(response: res);
//   @override
//   String toString() {
//     return 'Something went wrong.\nPlease try again.';
//   }
// }

// class ConflictException extends DioException {
//   Response? res;

//   ConflictException({this.res, required super.requestOptions})
//       : super(response: res);
//   @override
//   String toString() {
//     return res?.data?['message'].toString() ??
//         'Something went wrong.\nPlease try again.';
//   }
// }

// class UnprocessableException extends DioException {
//   Response? res;

//   UnprocessableException({this.res, required super.requestOptions})
//       : super(response: res);
//   @override
//   String toString() {
//     return res?.data?['errors']?['email']?[0] ??
//         res?.data?['message'].toString() ??
//         'Something went wrong.\nPlease try again.';
//   }
// }

// class NotFoundException extends DioException {
//   Response? res;

//   NotFoundException({this.res, required super.requestOptions})
//       : super(response: res);
//   @override
//   String toString() {
//     return 'Something went wrong.\nPlease try again.';
//   }
// }

// class UnauthorizedException extends DioException {
//   Response? res;

//   UnauthorizedException({this.res, required super.requestOptions})
//       : super(response: res);
//   @override
//   String toString() {
//     return res?.data?['message'].toString() ??
//         'Something went wrong.\nPlease try again.';
//   }
// }

// class BadRequestException extends DioException {
//   Response? res;

//   BadRequestException({this.res, required super.requestOptions})
//       : super(response: res);
//   @override
//   String toString() {
//     return res?.data?['message'].toString() ??
//         'Something went wrong.\nPlease try again.';
//   }
// }

// class ConnectTimeoutException extends DioException {
//   ConnectTimeoutException(RequestOptions requestOptions)
//       : super(requestOptions: requestOptions);

//   @override
//   String toString() {
//     return 'Connection timeout';
//   }
// }

// class DeadlineExceededException extends DioException {
//   DeadlineExceededException(RequestOptions requestOptions)
//       : super(requestOptions: requestOptions);
//   @override
//   String toString() {
//     return 'The connection has timed out.\nplease try again.';
//   }
// }
