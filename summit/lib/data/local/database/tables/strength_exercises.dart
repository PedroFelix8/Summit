import 'package:drift/drift.dart';

import 'package:summit/data/local/database/tables/workouts.dart';

class StrengthExercises extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get workoutId => integer().references(Workouts, #id)();
  TextColumn get name => text()();
  TextColumn get muscleGroup => text().nullable()();
}
