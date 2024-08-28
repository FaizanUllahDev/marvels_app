import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app_marvels/core/di/remote_di.dart';
import 'package:test_app_marvels/core/network/network_client.dart';
import 'package:test_app_marvels/core/network/network_constants.dart';
import 'package:test_app_marvels/core/network/network_info.dart';
import 'package:test_app_marvels/core/network/pretty_dio_logger.dart';

import 'presentation_di.dart';

final sl = GetIt.instance;

Future<void> initDIService() async {
  await dioInit();
  initRemoteDI();
  presentationDI();
}

Future<void> dioInit() async {
  // Initialize Dio and configure it with your specific settings
  //...

  final dio = Dio(
    BaseOptions(
      baseUrl: NetworkConstants.kFullBaseUrl,
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  dio.interceptors.addAll([
    PrettyDioLogger(
      requestBody: true,
      responseBody: true,
      request: true,
    ),
    CusotmDioInterceptor(),
  ]);
  sl.registerLazySingleton(() => NetworkInfoImpl());

  sl.registerLazySingleton<Dio>(() => dio);

  sl.registerLazySingleton(
    () => NetworkClient(dio: sl<Dio>()),
  );
}

/// ===================== Custom Dio Interceptor =====================

class CusotmDioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // add Authorization header

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // handle 401 error
    }
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // handle response
    super.onResponse(response, handler);
  }
}
