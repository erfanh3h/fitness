import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/Core/Network/api_result.dart';
import 'package:fitness/Core/Network/network_exceptions.dart';
import 'package:fitness/Core/Routes/server_routes.dart';
import 'package:fitness/Feature/Workout/Models/workout_details.dart';

abstract class WorkoutRepository {
  Future<ApiResult<List<WorkoutDetailsModel>>> readWorkouts(
      {required String day});

  Future<ApiResult<WorkoutDetailsModel>> createWorkout({
    required String name,
    required String time,
    required String day,
  });
  Future<ApiResult<bool>> updateWorkout({
    required String id,
    String? name,
    String? time,
  });
  Future<ApiResult<bool>> deleteWorkout({
    required String id,
  });
}

class WorkoutRepositoryImp extends WorkoutRepository {
  @override
  Future<ApiResult<List<WorkoutDetailsModel>>> readWorkouts(
      {required String day}) async {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      final CollectionReference collection =
          FirebaseFirestore.instance.collection(ServerRoutes.category);
      //get query of user workouts in certain day
      final data = await collection
          .where("userid", isEqualTo: userId)
          .where("day", isEqualTo: day)
          .get();
      final List<WorkoutDetailsModel> result = [];
      for (var element in data.docs) {
        result.add(
            WorkoutDetailsModel.fromJson(element.data() as Map, element.id));
      }
      //sort data by date
      result.sort((a, b) =>
          (a.date ?? DateTime.now()).compareTo(b.date ?? DateTime.now()));
      return ApiResult(resultData: result);
    } catch (_) {
      return ApiResult(
        errorData: NetworkExceptions(result: 'Error to read data from server'),
      );
    }
  }

  @override
  Future<ApiResult<WorkoutDetailsModel>> createWorkout({
    required String name,
    required String time,
    required String day,
  }) async {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      final WorkoutDetailsModel workout = WorkoutDetailsModel(
        day: day,
        name: name,
        time: time,
        userid: userId,
      );
      final CollectionReference collection =
          FirebaseFirestore.instance.collection('workouts');
      //add new workout
      var result = await collection.add(workout.toJson());
      final resultData = WorkoutDetailsModel.fromJson(
          (await result.get()).data() as Map, result.id);
      return ApiResult(resultData: resultData);
    } catch (_) {
      return ApiResult(
        errorData: NetworkExceptions(result: 'Error to read data from server'),
      );
    }
  }

  @override
  Future<ApiResult<bool>> updateWorkout({
    required String id,
    String? name,
    String? time,
  }) async {
    try {
      Map<String, dynamic> changes = {};
      if (time != null) {
        changes['time'] = time;
      }
      if (name != null) {
        changes['name'] = name;
      }
      final CollectionReference collection =
          FirebaseFirestore.instance.collection('workouts');
      //update workout
      await collection.doc(id).update(changes);
      return ApiResult(resultData: true);
    } catch (_) {
      return ApiResult(
        errorData: NetworkExceptions(result: 'Error to read data from server'),
      );
    }
  }

  @override
  Future<ApiResult<bool>> deleteWorkout({required String id}) async {
    try {
      final CollectionReference collection =
          FirebaseFirestore.instance.collection('workouts');
      //delete given workout
      await collection.doc(id).delete();
      return ApiResult(resultData: true);
    } catch (_) {
      return ApiResult(
        errorData: NetworkExceptions(result: 'Error to delete data'),
      );
    }
  }
}
