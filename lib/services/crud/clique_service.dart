// import 'dart:async';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:clique/services/crud/crud_exceptions.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart' show join;
// import 'package:path_provider/path_provider.dart';

// class CliqueService {
//   Database? _db;

//   List<DatabaseClique> _cliques = [];

//   static final CliqueService _shared = CliqueService._sharedInstance();
//   CliqueService._sharedInstance() {
//     _cliqueStreamController =
//         StreamController<List<DatabaseClique>>.broadcast();
//   }
// }

// class DatabaseUser {
//   final int id;
//   final String email;
//   const DatabaseUser({required this.id, required this.email});

//   DatabaseUser.fromRow(Map<String, Object?> map)
//       : id = map[idColumn] as int,
//         email = map[emailColumn] as String;
//   @override
//   String toString() => 'Person, ID = $id, email = $email';
//   @override
//   bool operator ==(covariant DatabaseUser other) => id == other.id;

//   @override
//   int get hashCode => id.hashCode;
// }

// const dbName = "notes.db";
// const noteTable = "note";
// const userTable = "user";
// const idColumn = "id";
// const emailColumn = "email";
// const userIdColumn = "user_id";
// const textColumn = "text";
// const isSyncedWithCloudColumn = "is_synced_with_cloud";
