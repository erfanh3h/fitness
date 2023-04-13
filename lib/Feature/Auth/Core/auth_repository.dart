import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/Core/Global/Controllers/global_controller.dart';
import 'package:fitness/Core/Global/Models/api_result.dart';
import 'package:fitness/Core/Network/network_exceptions.dart';
import 'package:get/get.dart';

abstract class AuthRepository {
  Future<ApiResult<User>> login({
    required String email,
    required String password,
  });

  Future<bool> logout();
}

class AuthRepositoryImp extends AuthRepository {
  @override
  Future<ApiResult<User>> login({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return ApiResult(resultData: userCredential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return ApiResult(
            errorData: NetworkExceptions(result: 'User not found!'));
      } else if (e.code == 'wrong-password') {
        return ApiResult(
            errorData: NetworkExceptions(result: 'Password is incorrect'));
      }
    }
    return ApiResult();
  }

  @override
  Future<bool> logout() async {
    final globalController = Get.find<GlobalController>();
    globalController.removeUserData();
    return true;
  }
}
