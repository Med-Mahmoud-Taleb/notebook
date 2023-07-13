import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notebook/features/components/custom_button.dart';
import 'package:notebook/features/notes/bloc/note_bloc.dart';
import 'package:notebook/features/notes/bloc/note_event.dart';
import 'package:notebook/features/notes/bloc/note_state.dart';
import 'package:notebook/utils/size.dart';

class WidgetFooterNote extends StatelessWidget {
  const WidgetFooterNote({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteBloc, NoteState>(builder: (context, state) {
      if (state is SelectedNoteState) {
        return SizedBox(
            width: double.infinity,
            height: AppSize.size_heigh_button_60,
            child: _buttonDeleteNote(state, context));
      }
      return Container();
    });
  }

  CustomButton _buttonDeleteNote(
      SelectedNoteState state, BuildContext context) {
    return CustomButton(
        onpressed: () {
          if (state.note != null) {
            context.read<NoteBloc>().add(DeleteNoteEvent(note: state.note!));
          }
        },
        title: "Supprimer");
  }
}
