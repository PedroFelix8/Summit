import 'package:drift/drift.dart';

import 'package:summit/data/local/database/tables/users.dart';

class Goals extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  TextColumn get title => text()();
  RealColumn get targetValue => real()();
  RealColumn get currentValue => real().withDefault(const Constant(0))();
  DateTimeColumn get deadline => dateTime().nullable()();
}
