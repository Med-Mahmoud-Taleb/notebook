import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notebook/features/components/custom_show_error.dart';
import 'package:notebook/features/notes/bloc/note_bloc.dart';
import 'package:notebook/features/notes/bloc/note_event.dart';
import 'package:notebook/features/notes/bloc/note_state.dart';
import 'package:notebook/features/notes/widgets/widget_listViewRadio_note.dart';
import 'package:notebook/features/notes/widgets/widget_listview_note.dart';

class BodyViewNote extends StatefulWidget {
  const BodyViewNote({
    Key? key,
  }) : super(key: key);

  @override
  State<BodyViewNote> createState() => _BodyViewNoteState();
}

class _BodyViewNoteState extends State<BodyViewNote> {
  @override
  void initState() {
    //Call method :  read all Note
    context.read<NoteBloc>().add(ReadNoteEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteBloc, NoteState>(builder: (context, state) {
      // Loading
      if (state is LoadingNoteState) {
        return const CircularProgressIndicator();
      }
      //Load data
      if (state is ReadNoteState) {
        return state.isListNoteEmpty
            ? const CustomWidgetShowhError()
            : WidgetListViewNote(
                notes: state.notes,
              );
      }
      // Check mode delete
      if (state is ModeDeleteNoteState) {
        return WidgetListViewRadioBox(
          notes: state.notes,
        );
      }
      // // Check update
      // if (state is UpdatedNoteState) {
      //   return WidgetListViewRadioBox(
      //     notes: state.notes,
      //   );
      // }
      // Check if no data.
      // if (state is EmptyNoteState) {
      //   return const CustomWidgetShowhError();
      // }

      if (state is SelectedNoteState) {
        return WidgetListViewRadioBox(
          notes: state.notes,
        );
      }
      return Container();
    });
  }
}
