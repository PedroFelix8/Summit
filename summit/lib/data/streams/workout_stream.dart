import 'package:drift/drift.dart';

import 'package:summit/data/local/database/app_database.dart';

class WorkoutStream {
  const WorkoutStream(this._database);

  final AppDatabase _database;

  Stream<List<Workout>> watch() {
    return (_database.select(_database.workouts)
          ..orderBy([
            (table) => OrderingTerm.desc(table.date),
          ]))
        .watch();
  }
}
