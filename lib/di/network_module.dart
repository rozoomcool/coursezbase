import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../domain/repository/shared/auth_shared_repository.dart';
import '../utils/api_constants.dart';

Dio configureDio(AuthSharedRepository authSharedRepository) {

  final options = BaseOptions(
    baseUrl: 'http://$baseUrl',
    headers: {"Accept": "application/json"},
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  );

  Dio dio = Dio(options);

  dio.interceptors.add(LogInterceptors());
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      options.headers["Authorization"] =
          "Bearer ${authSharedRepository.getAccessToken()}";
      return handler.next(options);
    },
    onError: (err, handler) async {
      var response = err.response;
      if (response != null && response.statusCode == 403) {
        final refreshResponse = await dio.post("/auth/refresh", data: {
          "refreshRequest": {"refresh": authSharedRepository.getRefreshToken()}
        });
        if (refreshResponse.statusCode == 200) {
          authSharedRepository.setTokens(
              refreshResponse.data["access"], refreshResponse.data["refresh"]);

          var options = err.requestOptions;

          options.headers["Authorization"] =
              authSharedRepository.getAccessToken();
          return handler.resolve(await dio.fetch(err.requestOptions));
        }
      }

      return handler.reject(err);
    },
  ));

  return dio;
}

class LogInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Accept"] = "application/json";
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path} | STATUS: ${response.statusCode}');
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}

class TokensInterceptors extends Interceptor {
  final AuthSharedRepository _authSharedRepository;

  TokensInterceptors(this._authSharedRepository);
//
// @override
// void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//   options.headers["Accept"] = "application/json";
//   options.headers["Authorization"] =
//   "Bearer ${_authSharedRepository.getAccessToken()}";
//
//   super.onRequest(options, handler);
// }

// @override
// Future onError(DioException err, ErrorInterceptorHandler handler) async {
//   if (err.response?.statusCode == 403) {
//     if (err.requestOptions.headers.containsKey("Authorization")) {
//       var options = err.requestOptions;
//       options.headers["Authorization"] =
//       "Bearer ${_authSharedRepository.getAccessToken()}";
//
//       return handler.resolve(await);
//     } else {
//
//     }
//   }
//   super.onError(err, handler);
// }
}
