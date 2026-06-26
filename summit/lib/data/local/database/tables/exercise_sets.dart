import 'package:drift/drift.dart';

import 'package:summit/data/local/database/tables/strength_exercises.dart';

class ExerciseSets extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get exerciseId => integer().references(StrengthExercises, #id)();
  IntColumn get setNumber => integer()();
  IntColumn get repetitions => integer()();
  RealColumn get weight => real().nullable()();
}
