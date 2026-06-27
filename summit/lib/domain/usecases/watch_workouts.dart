import 'package:summit/data/local/database/app_database.dart';
import 'package:summit/domain/repositories/workout_repository.dart';

class WatchWorkouts {
  const WatchWorkouts(this._repository);

  final WorkoutRepository _repository;

  Stream<List<Workout>> call() {
    return _repository.watchWorkouts();
  }
}
