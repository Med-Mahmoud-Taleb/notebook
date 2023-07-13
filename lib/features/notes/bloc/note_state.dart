// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:notebook/data/models/model_notes.dart';

abstract class NoteState {}

class InitialNoteState extends NoteState {}

class LoadingNoteState extends NoteState {}

class ReadNoteState extends NoteState {
  final List<Note> notes;
  final bool isListNoteEmpty;
  ReadNoteState({
    required this.notes,
    this.isListNoteEmpty = true,
  });
}

class AddedState extends NoteState {
  final List<Note> notes;

  AddedState({
    required this.notes,
  });
}

class UpdatedNoteState extends NoteState {
  final List<Note> notes;
  final Note? note;

  UpdatedNoteState({required this.notes, this.note});
}

class DeletedNoteState extends NoteState {
  final List<Note> notes;

  DeletedNoteState({
    required this.notes,
  });
}

class ModeDeleteNoteState extends NoteState {
  final List<Note> notes;

  ModeDeleteNoteState({
    required this.notes,
  });
}

class EmptyNoteState extends NoteState {}

class SelectedNoteState extends NoteState {
  final List<Note> notes;
  final Note? note;

  SelectedNoteState({
    required this.notes,
    this.note,
  });
}
