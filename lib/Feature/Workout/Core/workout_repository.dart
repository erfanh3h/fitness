import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/Core/Global/Controllers/global_controller.dart';
import 'package:fitness/Core/Global/Models/api_result.dart';
import 'package:fitness/Core/Network/network_exceptions.dart';
import 'package:get/get.dart';

abstract class WorkoutRepository {
  Future<ApiResult<User>> login({
    required String email,
    required String password,
  });

  Future<ApiResult<User>> register({
    required String email,
    required String password,
  });

  Future<bool> logout();
}

class WorkoutRepositoryImp extends WorkoutRepository {
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
  Future<ApiResult<User>> register({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return ApiResult(resultData: userCredential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return ApiResult(
            errorData: NetworkExceptions(result: 'Your password is to weak!'));
      } else if (e.code == 'email-already-in-use') {
        return ApiResult(
            errorData:
                NetworkExceptions(result: 'This email is already exists!'));
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
