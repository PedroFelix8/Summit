import 'package:drift/drift.dart';

import 'package:summit/data/local/database/tables/users.dart';

class Workouts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  DateTimeColumn get date => dateTime()();
  IntColumn get duration => integer()();
  TextColumn get type => text()();
  TextColumn get notes => text().nullable()();
}
