import 'package:summit/data/local/database/app_database.dart';
import 'package:summit/domain/repositories/workout_repository.dart';

class UpdateWorkout {
  const UpdateWorkout(this._repository);

  final WorkoutRepository _repository;

  Future<bool> call(Workout workout) {
    return _repository.updateWorkout(workout);
  }
}
