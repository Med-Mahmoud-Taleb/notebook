// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_null_comparison

import 'package:notebook/core/local/sqlite_db.dart';
import 'package:notebook/data/models/model_notes.dart';
import 'package:notebook/data/models/model_users.dart';

class UserRepositoryLocal {
  SqltiDB sqltiDB;
  UserRepositoryLocal({
    required this.sqltiDB,
  });

  Future<User?> checkUserName(String username) async {
    List<dynamic>? data = await sqltiDB
        .readData("SELECT * FROM USERS WHERE username = '${username}'");
    if (data != null) {
      List<User> users = data.map((e) => User.fromJson(e)).toList();
      return users.isNotEmpty ? users[0] : null;
    }
    return null;
  }

  Future<User?> findOneUser(int id) async {
    List<dynamic>? data =
        await sqltiDB.readData("SELECT * FROM USERS WHERE id= ${id}");
    if (data != null) {
      List<User> users = data.map((e) => User.fromJson(e)).toList();
      return users != null ? users[0] : null;
    }
    return null;
  }

  Future<User?> authUser(
      {required String username, required String password}) async {
    List<dynamic>? data = await sqltiDB.readData(
        "SELECT * FROM USERS WHERE username = '${username}' AND password = '${password}'");
    if (data != null) {
      List<User> users = data.map((e) => User.fromJson(e)).toList();
      return users.isNotEmpty ? users[0] : null;
    }
    return null;
  }

  // Future<List<Note>?> readNotes() async {
  //   List<dynamic>? data = await sqltiDB.readData("SELECT * FROM NOTES");

  //   if (data != null) {
  //     List<Note>? notes = data.map((e) => Note.fromJson(e)).toList();
  //     return notes;
  //   }
  //   return null;
  // }

  Future<User?> addUser(
      {required String username, required String password}) async {
    int? response = await sqltiDB.insertData(
      "INSERT INTO Users(username, password) VALUES(?, ?)",
      [username, password],
    );

    if (response != null) {
      print("User : $response");
      return await authUser(username: username, password: password);
    }
    return null;
  }

  Future<User?> updateUser(
      {required int id,
      required String username,
      required String password}) async {
    int? response = await sqltiDB.updateData(
      'UPDATE users SET username = ?,  password = ? WHERE id = ?',
      [
        username,
        password,
        id,
      ],
    );

    if (response != null) {
      return await findOneUser(id);
    }
    return null;
  }
}
