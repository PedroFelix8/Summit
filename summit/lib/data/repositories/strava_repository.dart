import 'package:drift/drift.dart';

import 'package:summit/data/local/database/app_database.dart';

class StravaRepository {
  const StravaRepository(this._database);

  final AppDatabase _database;

  Future<List<StravaConnection>> getStravaConnections() {
    return _database.select(_database.stravaConnections).get();
  }

  Future<StravaConnection?> getStravaConnectionByUser(int userId) {
    return (_database.select(_database.stravaConnections)
          ..where((table) => table.userId.equals(userId)))
        .getSingleOrNull();
  }

  Future<int> insertStravaConnection(
    StravaConnectionsCompanion connection,
  ) {
    return _database.into(_database.stravaConnections).insert(connection);
  }

  Future<bool> updateStravaConnection(StravaConnection connection) {
    return _database.update(_database.stravaConnections).replace(connection);
  }

  Future<int> deleteStravaConnection(int id) {
    return (_database.delete(_database.stravaConnections)
          ..where((table) => table.id.equals(id)))
        .go();
  }

  Future<int> deleteStravaConnectionByUser(int userId) {
    return (_database.delete(_database.stravaConnections)
          ..where((table) => table.userId.equals(userId)))
        .go();
  }
}
