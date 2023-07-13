// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_null_comparison

import 'package:notebook/core/local/sqlite_db.dart';
import 'package:notebook/data/models/model_notes.dart';

class NoteRepositoryLocal {
  SqltiDB sqltiDB;
  NoteRepositoryLocal({
    required this.sqltiDB,
  });

  Future<Note?> findOneNote(int id) async {
    List<dynamic>? data =
        await sqltiDB.readData("SELECT * FROM NOTES WHERE id= ${id}");
    if (data != null) {
      List<Note> notes = data.map((e) => Note.fromJson(e)).toList();
      return notes != null ? notes[0] : null;
    }
    return null;
  }

  Future<List<Note>?> readNotes() async {
    List<dynamic>? data = await sqltiDB.readData("SELECT * FROM NOTES");

    if (data != null) {
      List<Note>? notes = data.map((e) => Note.fromJson(e)).toList();
      return notes;
    }
    return null;
  }

  Future<Note?> addNote(Note note) async {
    int? id = await sqltiDB.insertData(
      "INSERT INTO Notes(title, describe) VALUES(?, ?)",
      [note.title, note.describe],
    );

    if (id != null) {
      return await findOneNote(id);
    }
    return null;
  }

  Future<Note?> updateNote(Note note) async {
    int? response = await sqltiDB.updateData(
      'UPDATE notes SET title = ?,  describe = ? WHERE id = ?',
      [
        note.title,
        note.describe,
        note.id,
      ],
    );

    if (response != null) {
      return await findOneNote(note.id!);
    }
    return null;
  }

  Future<Note?> deleteNote(Note note) async {
    int? response = await sqltiDB.deleteData(
      'DELETE FROM Notes WHERE id = ?',
      [note.id],
    );
    if (response != null) {
      return note;
    }
    return null;
  }
}
