// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notebook/features/notes/bloc/map_event_to_state_note.dart';
import 'package:notebook/features/notes/bloc/note_event.dart';
import 'package:notebook/features/notes/bloc/note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  MapEventToStateNote mapEventToStateNote;
  NoteBloc(
    this.mapEventToStateNote,
  ) : super(InitialNoteState());

  @override
  Stream<NoteState> mapEventToState(NoteEvent event) async* {
    yield LoadingNoteState();

    if (event is ReadNoteEvent) {
      yield* mapEventToStateNote.mapReadNoteEventToState(event);
    }

    if (event is AddNoteEvent) {
      yield* mapEventToStateNote.mapAddNoteEventToState(event);
    }

    if (event is UpdateNoteEvent) {
      yield* mapEventToStateNote.mapUpdateNoteEventToState(event);
    }

    if (event is DeleteNoteEvent) {
      yield* mapEventToStateNote.mapDeleteNoteEventToState(event);
    }
    if (event is ModeDeleteNoteEvent) {
      yield* mapEventToStateNote.mapModeDeleteNoteEventToState();
    }

    if (event is SelectNoteEvent) {
      print("Selecte");
      yield* mapEventToStateNote.mapSelectNoteEventToState(event);
    }

    if (event is CancelDeleteNoteEvent) {
      yield* mapEventToStateNote.mapCancelDeleteNoteEventToState(event);
    }
  }
}
