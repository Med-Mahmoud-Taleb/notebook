import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notebook/features/components/cutom_icon.dart';
import 'package:notebook/features/notes/bloc/note_bloc.dart';
import 'package:notebook/features/notes/bloc/note_event.dart';
import 'package:notebook/features/notes/bloc/note_state.dart';
import 'package:notebook/features/notes/widgets/widget_form_note.dart';
import 'package:notebook/utils/size.dart';
import 'package:notebook/utils/text_style.dart';
import 'package:notebook/utils/widgets_styles.dart';

class WidgetHeaderNote extends StatelessWidget {
  const WidgetHeaderNote({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.size_heigh_button_60,
      padding: AppSize.size_symmetric_horizontal_8,
      decoration: AppBoxDecretion.styleBoxDecorationBlack,
      child: Row(
        children: [
          _buttonCancel(),
          const Spacer(),
          Row(
            children: [
              _buttonAddNote(context),
              AppSize.whit_space_height_8,
              _checkStateButtonDeleteNote(context),
            ],
          )
        ],
      ),
    );
  }

  BlocBuilder<NoteBloc, NoteState> _checkStateButtonDeleteNote(
      BuildContext context) {
    return BlocBuilder<NoteBloc, NoteState>(builder: (context, state) {
      if (state is ReadNoteState) {
        print("Ui header dele");
        return state.isListNoteEmpty ? Container() : _buttonDelete(context);
      } else if (state is SelectedNoteState || state is ModeDeleteNoteState) {
        return Container();
      } else {
        return _buttonDelete(context);
      }
    });
  }

  CustomIconButton _buttonDelete(BuildContext context) {
    return CustomIconButton(
        iconData: AppIcons.delete_icon,
        onpressed: () {
          context.read<NoteBloc>().add(ModeDeleteNoteEvent());
        });
  }

  BlocBuilder<NoteBloc, NoteState> _buttonAddNote(BuildContext context) {
    return BlocBuilder<NoteBloc, NoteState>(builder: (context, state) {
      if (state is SelectedNoteState || state is ModeDeleteNoteState) {
        return Container();
      } else {
        return CustomIconButton(
            iconData: AppIcons.add_icon,
            onpressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const WidgetFormNote();
              }));
            });
      }
    });
  }

  BlocBuilder<NoteBloc, NoteState> _buttonCancel() {
    return BlocBuilder<NoteBloc, NoteState>(builder: (context, state) {
      if (state is ModeDeleteNoteState || state is SelectedNoteState) {
        return CustomIconButton(
          onpressed: () {
            context.read<NoteBloc>().add(CancelDeleteNoteEvent());
          },
          iconData: Icons.cancel,
        );
      } else {
        return Container();
      }
    });
  }
}
