// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:notebook/data/models/model_notes.dart';
import 'package:notebook/data/repositories/notes/repo_notes_local.dart';
import 'package:notebook/features/notes/bloc/note_event.dart';
import 'package:notebook/features/notes/bloc/note_state.dart';

class MapEventToStateNote {
  // ignore: unused_field
  NoteRepositoryLocal noteRepositoryLocal;
  MapEventToStateNote({
    required this.noteRepositoryLocal,
  });

  static late List<Note> _noteList;

  // ignore: unused_element
  Stream<NoteState> mapReadNoteEventToState(ReadNoteEvent event) async* {
    _noteList = await Future.delayed(const Duration(seconds: 1),
        () async => (await noteRepositoryLocal.readNotes())!);

    if (_noteList.isEmpty) {
      yield ReadNoteState(notes: _noteList);
    } else {
      yield ReadNoteState(notes: _noteList, isListNoteEmpty: false);
    }
  }

  // ignore: unused_element
  Stream<NoteState> mapAddNoteEventToState(AddNoteEvent event) async* {
    Note? response = await noteRepositoryLocal.addNote(event.note);
    if (response != null) {
      _noteList.add(response);
      yield ReadNoteState(notes: _noteList, isListNoteEmpty: false);
    }
  }

  // ignore: unused_element
  Stream<NoteState> mapUpdateNoteEventToState(UpdateNoteEvent event) async* {
    Note? response = await noteRepositoryLocal.updateNote(event.note);
    if (response != null) {
      final index = _noteList.indexWhere((e) => e.id == response.id);

      if (index != -1) {
        _noteList[index] = response;
        yield ReadNoteState(notes: _noteList, isListNoteEmpty: false);
      }
    }
  }

  // ignore: unused_element
  Stream<NoteState> mapDeleteNoteEventToState(DeleteNoteEvent event) async* {
    Note? response = await noteRepositoryLocal.deleteNote(event.note);

    if (response != null) {
      _noteList.remove(response);
      if (_noteList.isEmpty) {
        yield ReadNoteState(notes: _noteList);
      } else {
        yield ReadNoteState(notes: _noteList, isListNoteEmpty: false);
      }
    }
  }

  // ignore: unused_element
  Stream<NoteState> mapModeDeleteNoteEventToState() async* {
    yield ModeDeleteNoteState(notes: _noteList);
  }

  // ignore: unused_element
  Stream<NoteState> mapSelectNoteEventToState(SelectNoteEvent event) async* {
    yield SelectedNoteState(notes: _noteList, note: event.note);
  }

// ignore: unused_element
  Stream<NoteState> mapCancelDeleteNoteEventToState(
      CancelDeleteNoteEvent event) async* {
    yield ReadNoteState(notes: _noteList, isListNoteEmpty: false);
  }
}
