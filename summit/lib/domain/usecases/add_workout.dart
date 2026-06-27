import 'package:summit/data/local/database/app_database.dart';
import 'package:summit/domain/repositories/workout_repository.dart';

class AddWorkout {
  const AddWorkout(this._repository);

  final WorkoutRepository _repository;

  Future<int> call(WorkoutsCompanion workout) {
    return _repository.insertWorkout(workout);
  }
}
