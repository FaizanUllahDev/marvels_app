import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:test_app_marvels/core/di/di_server.dart';
import 'package:test_app_marvels/core/error/exceptions.dart';
import 'package:test_app_marvels/core/network/network_info.dart';
import 'package:test_app_marvels/core/utils/utils.dart';

import '../type_def/type_def.dart';

class NetworkClient {
  final Dio dio;

  /// is used to get token stored locally and verify our request
  // final SPManager spManager;
  NetworkClient({required this.dio});

  static final authHeader = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Accept': 'application/json',
  };

  Future<Response> invoke(
    String url,
    RequestType requestType, {
    ResultMap? queryParameters,
    ResultMap? headers,
    dynamic requestBody,
    bool isBytes = false,
    bool isPost = false,
    bool isToken = false,
  }) async {
    final isConnected = await sl<NetworkInfoImpl>().isConnected;

    if (!isConnected) {
      throw const GeneralException(message: "No Internet");
    }

    Response? response;

    url = '$url?${Utils.getHashed()}';

    try {
      switch (requestType) {
        case RequestType.get:
          response = await dio.get(url,
              queryParameters: queryParameters,
              options:
                  Options(responseType: ResponseType.json, headers: headers));
          break;
        case RequestType.post:
          response = await dio.post(url,
              queryParameters: queryParameters,
              data: requestBody,
              options:
                  Options(responseType: ResponseType.json, headers: headers));
          break;
        case RequestType.put:
          response = await dio.put(url,
              queryParameters: queryParameters,
              data: requestBody,
              options:
                  Options(responseType: ResponseType.json, headers: headers));
          break;
        case RequestType.delete:
          response = await dio.delete(url,
              queryParameters: queryParameters,
              data: requestBody,
              options:
                  Options(responseType: ResponseType.json, headers: headers));
          break;
        case RequestType.patch:
          response = await dio.patch(url,
              queryParameters: queryParameters,
              data: requestBody,
              options:
                  Options(responseType: ResponseType.json, headers: headers));
          break;
      }

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response;
      }

      throw GeneralException(
        message: response.data?['error_description'] ??
            response.data?['error'] ??
            'Something went wrong!',
      );
    }

    // DioError [DioErrorType.RESPONSE]: Http status error [400]
    on DioException catch (dioError) {
      Utils.debug("DioException: dioError: $dioError");
      try {
        throw _handleError(dioError);
      } // Exception: Instance of 'Exception'
      catch (exception) {
        Utils.debug("exception $exception");
        (exception is GeneralException)
            ? throw (exception)
            : throw GeneralException(
                message: exception.toString(),
              );
      }
    }
    // TypeError: Instance of 'TypeError'
    on TypeError catch (e) {
      throw GeneralException(message: e.toString());
    }
    // NoSuchMethodError: The method '[]' was called on null.
    on NoSuchMethodError catch (_) {
      throw const GeneralException(message: 'Method not found!');
    } on SocketException catch (exception) {
      throw GeneralException(message: exception.toString());
    }
  }

  CustomException _handleError(DioException dioError) {
    try {
      final error = ((dioError.response?.data) is Map<String, dynamic>)
          ? (dioError.response?.data)
          : null;
      switch (dioError.response?.statusCode) {
        case 400:
          return GeneralException(
              message: error?['error_description'] ??
                  '400: The request parameters are invalid or missing!');
        case 405:
        case 404:
          return GeneralException(
              message:
                  '${dioError.response!.statusCode}: The resource does not exist!');
        case 500:
          return const GeneralException(message: 'Server not responding!');
        default:
          return GeneralException(
            message: error?['error'] ??
                'Unable to process the request at the moment!',
          );
      }
    } catch (e) {
      return GeneralException(message: e.toString());
    }
  }
}

enum RequestType { get, post, put, delete, patch }
