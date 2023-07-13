// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:notebook/data/models/model_notes.dart';

abstract class NoteEvent {}

class ReadNoteEvent extends NoteEvent {}

class AddNoteEvent extends NoteEvent {
  Note note;
  AddNoteEvent({
    required this.note,
  });
}

class UpdateNoteEvent extends NoteEvent {
  Note note;
  UpdateNoteEvent({
    required this.note,
  });
}

class SelectNoteEvent extends NoteEvent {
  Note note;
  SelectNoteEvent({
    required this.note,
  });
}

class DeleteNoteEvent extends NoteEvent {
  Note note;

  DeleteNoteEvent({
    required this.note,
  });
}

class ModeDeleteNoteEvent extends NoteEvent {}

class CancelDeleteNoteEvent extends NoteEvent {}
