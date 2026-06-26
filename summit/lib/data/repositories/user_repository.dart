import 'package:drift/drift.dart';

import 'package:summit/data/local/database/app_database.dart';

class UserRepository {
  const UserRepository(this._database);

  final AppDatabase _database;

  Future<List<User>> getUsers() {
    return _database.select(_database.users).get();
  }

  Future<User?> getUserById(int id) {
    return (_database.select(_database.users)
          ..where((table) => table.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> insertUser(UsersCompanion user) {
    return _database.into(_database.users).insert(user);
  }

  Future<bool> updateUser(User user) {
    return _database.update(_database.users).replace(user);
  }

  Future<int> deleteUser(int id) {
    return (_database.delete(_database.users)
          ..where((table) => table.id.equals(id)))
        .go();
  }
}
