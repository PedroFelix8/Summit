import 'package:summit/domain/repositories/workout_repository.dart';

class DeleteWorkout {
  const DeleteWorkout(this._repository);

  final WorkoutRepository _repository;

  Future<int> call(int id) {
    return _repository.deleteWorkout(id);
  }
}
