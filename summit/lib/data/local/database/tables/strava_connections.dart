import 'package:drift/drift.dart';

import 'package:summit/data/local/database/tables/users.dart';

class StravaConnections extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().unique().references(Users, #id)();
  TextColumn get accessToken => text()();
  TextColumn get refreshToken => text()();
  DateTimeColumn get expiresAt => dateTime()();
}
