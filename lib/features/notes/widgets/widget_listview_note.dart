// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:notebook/data/models/model_notes.dart';

import 'package:notebook/features/components/custom_listTitle.dart';
import 'package:notebook/features/notes/widgets/widget_form_note.dart';

class WidgetListViewNote extends StatefulWidget {
  final List<Note> notes;
  const WidgetListViewNote({
    Key? key,
    required this.notes,
  }) : super(key: key);

  @override
  State<WidgetListViewNote> createState() => _WidgetListViewNoteState();
}

class _WidgetListViewNoteState extends State<WidgetListViewNote> {
  int checkButton = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
                  height: 8,
                ),
            itemCount: widget.notes.length,
            itemBuilder: (context, index) {
              return _buttonNoteDetail(index, context);
            }));
  }

  CustuomListTilte _buttonNoteDetail(int index, BuildContext context) {
    return CustuomListTilte(
      title: widget.notes[index].describe,
      subTitle: widget.notes[index].date!,
      onpressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return WidgetFormNote(note: widget.notes[index]);
        }));
      },
    );
  }
}
