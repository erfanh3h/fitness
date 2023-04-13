import 'package:get/get.dart';
import 'package:fitness/Core/Routes/app_routes.dart';
import '../Global/Controllers/global_controller.dart';
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

  NetworkExceptions handleErrorStatus(
    dynamic response, {
    final String? defaultErrorText,
  }) {
    String errorText = '';
    if (defaultErrorText != null) {
      errorText = defaultErrorText;
    } else {
      errorText = "Please check your internet connection and try again";
    }
    try {
      errorText = (response.data['message']);
      // if (response.data['errors'].keys.length != 0) {
      //   errorText = response.data['errors'][response.data['errors'].keys.first]
      //       .toString();
      // }
    } catch (_) {}
    if (response.statusCode == 401) {
      var globalController = Get.find<GlobalController>();
      globalController.removeUserData();
      Get.toNamed(AppRoutes.login);
      try {
        errorText = response.data['detail'];
      } catch (_) {
        errorText = 'Please login to your account';
      }
    }
    final error =
        NetworkExceptions.fromResult(response.statusCode ?? 422, errorText);

    return error;
  }
}
