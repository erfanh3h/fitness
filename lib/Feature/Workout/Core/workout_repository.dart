import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/Core/Global/Models/api_result.dart';
import 'package:fitness/Core/Network/network_exceptions.dart';
import 'package:fitness/Feature/Workout/Models/workout_details.dart';

abstract class WorkoutRepository {
  Future<ApiResult<List<WorkoutDetailsModel>>> readWorkouts(
      {required String day});
}

class WorkoutRepositoryImp extends WorkoutRepository {
  @override
  Future<ApiResult<List<WorkoutDetailsModel>>> readWorkouts(
      {required String day}) async {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      final CollectionReference collection =
          FirebaseFirestore.instance.collection('workouts');
      final data = await collection
          .where("userid", isEqualTo: userId)
          .where("day", isEqualTo: day)
          .get();
      final List<WorkoutDetailsModel> result = [];
      for (var element in data.docs) {
        result.add(
            WorkoutDetailsModel.fromJson(element.data() as Map, element.id));
      }
      return ApiResult(resultData: result);
    } catch (_) {
      return ApiResult(
        errorData: NetworkExceptions(result: 'Error to read data from server'),
      );
    }
  }
}
