import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notebook/data/models/model_notes.dart';
import 'package:notebook/features/components/custom_button.dart';
import 'package:notebook/features/components/custom_field.dart';
import 'package:notebook/features/components/screen_responsive.dart';
import 'package:notebook/features/notes/bloc/note_bloc.dart';
import 'package:notebook/features/notes/bloc/note_event.dart';
import 'package:notebook/features/notes/bloc/note_state.dart';
import 'package:notebook/utils/colors.dart';
import 'package:notebook/utils/size.dart';
import 'package:notebook/utils/text_style.dart';

class WidgetFormNote extends StatefulWidget {
  final Note? note;
  const WidgetFormNote({
    this.note,
    Key? key,
  }) : super(key: key);

  @override
  State<WidgetFormNote> createState() => _WidgetFormNoteState();
}

class _WidgetFormNoteState extends State<WidgetFormNote> {
  int nbr = 0;
  late TextEditingController titleController;
  late TextEditingController describeController;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    titleController = TextEditingController();
    describeController = TextEditingController();
    if (widget.note != null) {
      titleController.text = widget.note!.title;
      describeController.text = widget.note!.describe;
    }

    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    describeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    late Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false, // Put keyboard on the screen
          backgroundColor: AppColors.colorGrey,
          body: ScreenResponsive(
            body: Form(
              key: _formKey,
              child: Column(children: [
                _buttonDone(size),
                _fieldDescribeNote(),
              ]),
            ),
          )),
    );
  }

  BlocListener<NoteBloc, NoteState> _buttonDone(Size size) {
    return BlocListener<NoteBloc, NoteState>(
      listener: (context, state) {
        if (state is ReadNoteEvent) {
          context.read<NoteBloc>().add(ReadNoteEvent());
        }
      },
      child: Container(
        height: size.height * 0.08,
        color: AppColors.colorGrey,
        child: Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () {
              if (describeController.text.isNotEmpty) {
                widget.note == null
                    ? context.read<NoteBloc>().add(
                          AddNoteEvent(
                              note: Note(
                            title: titleController.text,
                            describe: describeController.text,
                          )),
                        )
                    : context.read<NoteBloc>().add(UpdateNoteEvent(
                            note: Note(
                          id: widget.note!.id,
                          title: titleController.text,
                          describe: describeController.text,
                        )));
              }
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
      ),
    );
  }

  Expanded _fieldDescribeNote() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomTextField(
          controller: describeController,
          hintText: "Ecrivez votre note",
          textInputType: TextInputType.multiline,
          maxLines: 200,
          obscureText: false,
        ),
      ),
    );
  }
}
