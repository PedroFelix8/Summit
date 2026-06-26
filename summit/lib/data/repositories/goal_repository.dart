import 'package:drift/drift.dart';

import 'package:summit/data/local/database/app_database.dart';

class GoalRepository {
  const GoalRepository(this._database);

  final AppDatabase _database;

  Future<List<Goal>> getGoals() {
    return _database.select(_database.goals).get();
  }

  Future<List<Goal>> getGoalsByUser(int userId) {
    return (_database.select(_database.goals)
          ..where((table) => table.userId.equals(userId)))
        .get();
  }

  Future<Goal?> getGoalById(int id) {
    return (_database.select(_database.goals)
          ..where((table) => table.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> insertGoal(GoalsCompanion goal) {
    return _database.into(_database.goals).insert(goal);
  }

  Future<bool> updateGoal(Goal goal) {
    return _database.update(_database.goals).replace(goal);
  }

  Future<int> deleteGoal(int id) {
    return (_database.delete(_database.goals)
          ..where((table) => table.id.equals(id)))
        .go();
  }
}
