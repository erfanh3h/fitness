import 'package:fitness/Core/Global/Controllers/global_controller.dart';
import 'package:fitness/Core/Global/Controllers/main_controller.dart';
import 'package:fitness/Core/Global/Models/api_result.dart';
import 'package:fitness/Core/Global/Models/user_tokens_model.dart';
import 'package:fitness/Core/Network/network_exceptions.dart';
import 'package:fitness/Core/Network/rest_client.dart';
import 'package:fitness/Core/Routes/app_routes.dart';
import 'package:fitness/Core/Routes/server_routes.dart';
import 'package:get/get.dart';

abstract class AuthRepository {
  Future<ApiResult<UserTokensModel>> login({
    required String email,
    required String password,
  });
  Future<ApiResult<bool>> register({required Map<String, dynamic> userData});

  Future<ApiResult<UserTokensModel>> registerVerify({
    required String email,
    required String code,
  });

  Future<ApiResult<bool>> forgetPassword({
    required String email,
  });
  Future<ApiResult<bool>> resendActivationCode({required String email});

  Future<ApiResult<bool>> changePassword({
    required String tempToken,
    required String password,
  });

  Future<ApiResult<bool>> checkUsernameExists({required String username});

  Future<bool> logout();

  Future<ApiResult<bool>> deleteAccount();
}

class AuthRepositoryImp extends AuthRepository {
  final RestClient _restClient = RestClient();

  @override
  Future<ApiResult<UserTokensModel>> login({
    required String email,
    required String password,
  }) async {
    var response = await _restClient.sendData(
      ServerRoutes.login,
      data: {
        'email': email,
        'password': password,
      },
    );
    UserTokensModel? data;
    NetworkExceptions? errorData;
    if (response.resultData != null) {
      data = UserTokensModel.fromJson(
        'Bearer ${response.resultData['access']}',
        'Bearer ${response.resultData['refresh']}',
        response.resultData['done'],
      );
    } else {
      errorData = response.errorData;
    }
    var result =
        ApiResult<UserTokensModel>(resultData: data, errorData: errorData);
    return result;
  }

  @override
  Future<ApiResult<bool>> register({
    required Map<String, dynamic> userData,
  }) async {
    var response = await _restClient.sendData(
      ServerRoutes.register,
      data: userData,
    );
    bool? data;
    NetworkExceptions? errorData;
    if (response.resultData != null) {
      data = true;
    } else {
      errorData = response.errorData;
    }
    var result = ApiResult<bool>(resultData: data, errorData: errorData);
    return result;
  }

  @override
  Future<ApiResult<bool>> forgetPassword({
    required String email,
  }) async {
    var response = await _restClient
        .sendData(ServerRoutes.forgetPass, data: {'email': email});
    bool? data;
    NetworkExceptions? errorData;
    if (response.resultData != null) {
      data = true;
    } else {
      errorData = response.errorData;
    }
    var result = ApiResult<bool>(resultData: data, errorData: errorData);
    return result;
  }

  @override
  Future<ApiResult<UserTokensModel>> registerVerify({
    required String email,
    required String code,
  }) async {
    var response = await _restClient.sendData(
      ServerRoutes.registerVerify,
      data: {
        'email': email,
        'code': code,
      },
    );
    UserTokensModel? data;
    NetworkExceptions? errorData;
    if (response.resultData != null) {
      data = UserTokensModel.fromJson(
        'Bearer ${response.resultData['data']['access']}',
        'Bearer ${response.resultData['data']['refresh']}',
        false,
      );
    } else {
      errorData = response.errorData;
    }
    var result =
        ApiResult<UserTokensModel>(resultData: data, errorData: errorData);
    return result;
  }

  @override
  Future<ApiResult<bool>> resendActivationCode({
    required String email,
  }) async {
    var response = await _restClient
        .sendData(ServerRoutes.resendCode, data: {'email': email});
    bool? data;
    NetworkExceptions? errorData;
    if (response.resultData != null) {
      data = true;
    } else {
      errorData = response.errorData;
    }
    var result = ApiResult<bool>(resultData: data, errorData: errorData);
    return result;
  }

  @override
  Future<ApiResult<bool>> changePassword({
    required String tempToken,
    required String password,
  }) async {
    var response = await _restClient.sendData(
      ServerRoutes.changePassword,
      data: {
        'password': password,
        'password_confirmation': password,
      },
      headers: {
        'X-Requested-With': 'XMLHttpRequest',
        'Authorization': tempToken,
      },
    );
    bool? data;
    NetworkExceptions? errorData;
    if (response.resultData != null) {
      data = true;
    } else {
      errorData = response.errorData;
    }
    var result = ApiResult<bool>(resultData: data, errorData: errorData);
    return result;
  }

  @override
  Future<ApiResult<bool>> checkUsernameExists({
    required String username,
  }) async {
    var response = await _restClient.sendData(
      ServerRoutes.login,
      data: {'user_name': username},
    );
    bool? data;
    NetworkExceptions? errorData;
    if (response.resultData != null) {
      data = response.resultData['data']['status'];
    } else {
      errorData = response.errorData;
    }
    var result = ApiResult<bool>(resultData: data, errorData: errorData);
    return result;
  }

  @override
  Future<bool> logout() async {
    Get.offAllNamed(AppRoutes.login);
    await Future.delayed(const Duration(milliseconds: 200));
    Get.delete<MainController>();
    await Future.delayed(const Duration(milliseconds: 200));
    Get.put(MainController());
    await Future.delayed(const Duration(milliseconds: 200));
    // Get.delete<GlobalController>();
    // await Future.delayed(const Duration(milliseconds: 200));
    // Get.put(
    //   GlobalController(
    //     Get.find<GlobalRepository>(),
    //     Get.find<ProfileRepository>(),
    //   ),
    // );
    await Future.delayed(const Duration(milliseconds: 500));
    final globalController = Get.find<GlobalController>();
    globalController.removeUserData();
    return true;
  }

  @override
  Future<ApiResult<bool>> deleteAccount() async {
    var response = await _restClient.deleteData(
      ServerRoutes.login,
    );
    bool? data;
    NetworkExceptions? errorData;
    if (response.resultData != null) {
      data = true;
    } else {
      errorData = response.errorData;
    }
    var result = ApiResult<bool>(resultData: data, errorData: errorData);
    return result;
  }
}
