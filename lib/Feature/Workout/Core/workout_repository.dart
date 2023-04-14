import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/Core/Global/Models/api_result.dart';
import 'package:fitness/Core/Network/network_exceptions.dart';

abstract class WorkoutRepository {
  Future<ApiResult<User>> login({
    required String email,
    required String password,
  });
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
}
