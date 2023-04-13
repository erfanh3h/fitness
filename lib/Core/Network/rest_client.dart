import '../Global/Models/api_result.dart';

import 'network_exceptions.dart';

class RestClient {
  Future<ApiResult<T>> getData<T>(
    final String url, {
    final Map<String, String>? headers,
  }) async {
    return ApiResult.failure(
      error: NetworkExceptions(
          result: "Please check your internet connection and try again"),
    );
  }

  // Post request
  Future<ApiResult> sendData(
    final String url, {
    final Map<String, dynamic>? data,
    final Map<String, String>? headers,
    final String? defaultErrorText,
    final bool isFormData = false,
  }) async {
    return ApiResult.failure(
      error: NetworkExceptions(
          result: "Please check your internet connection and try again"),
    );
  }

  // put request
  Future<ApiResult> putData(
    final String url, {
    final Map<String, dynamic>? data,
    final Map<String, String>? headers,
    final String? defaultErrorText,
    final bool isFormData = false,
  }) async {
    return ApiResult.failure(
      error: NetworkExceptions(
          result: "Please check your internet connection and try again"),
    );
  }

  // Patch request
  Future<ApiResult> patchData(
    final String url, {
    final Map<String, dynamic>? data,
    final Map<String, String>? headers,
    final String? defaultErrorText,
    final bool isFormData = false,
  }) async {
    return ApiResult.failure(
      error: NetworkExceptions(
          result: "Please check your internet connection and try again"),
    );
  }

  Future<ApiResult> deleteData(
    final String url, {
    final Map<String, dynamic>? data,
    final Map<String, String>? headers,
    final String? defaultErrorText,
    final bool isFormData = false,
  }) async {
    return ApiResult.failure(
      error: NetworkExceptions(
          result: "Please check your internet connection and try again"),
    );
  }
}
