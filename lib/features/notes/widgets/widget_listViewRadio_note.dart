import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notebook/data/models/model_notes.dart';
import 'package:notebook/features/components/custom_listTitle.dart';
import 'package:notebook/features/notes/bloc/note_bloc.dart';
import 'package:notebook/features/notes/bloc/note_event.dart';
import 'package:notebook/features/notes/widgets/widget_form_note.dart';
import 'package:notebook/utils/size.dart';

class WidgetListViewRadioBox extends StatefulWidget {
  final List<Note> notes;

  const WidgetListViewRadioBox({
    Key? key,
    required this.notes,
  }) : super(key: key);

  @override
  State<WidgetListViewRadioBox> createState() => _WidgetListViewRadioBoxState();
}

class _WidgetListViewRadioBoxState extends State<WidgetListViewRadioBox> {
  int checkButton = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          separatorBuilder: (context, index) => AppSize.whit_space_height_8,
          itemCount: widget.notes.length,
          itemBuilder: (context, index) {
            return CustuomListTilte(
              title: widget.notes[index].describe,
              trailing: _checkItemNote(index, context),
              subTitle: widget.notes[index].date!,
            );
          }),
    );
  }

  Radio<int> _checkItemNote(int index, BuildContext context) {
    return Radio<int>(
        value: widget.notes[index].id!,
        groupValue: checkButton,
        onChanged: (int? value) {
          setState(() {
            checkButton = value!;
          });
          if (checkButton > 0) {
            context
                .read<NoteBloc>()
                .add(SelectNoteEvent(note: widget.notes[index]));
          }
        });
  }
}
