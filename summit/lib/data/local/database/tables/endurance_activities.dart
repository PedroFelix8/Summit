import 'package:drift/drift.dart';

import 'package:summit/data/local/database/tables/workouts.dart';

class EnduranceActivities extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get workoutId => integer().unique().references(Workouts, #id)();
  TextColumn get sport => text()();
  RealColumn get distance => real().nullable()();
  RealColumn get pace => real().nullable()();
  RealColumn get elevation => real().nullable()();
}
