import 'package:flutter/material.dart';
import 'package:notebook/core/local/sqlite_db.dart';
import 'package:notebook/data/repositories/notes/repo_notes_local.dart';
import 'package:notebook/features/components/screen_responsive.dart';
import 'package:notebook/features/notes/widgets/widget_body_note.dart';
import 'package:notebook/features/notes/widgets/widget_footer_note.dart';
import 'package:notebook/features/notes/widgets/widget_header_note.dart';
import 'package:notebook/utils/colors.dart';
import 'package:notebook/utils/size.dart';

// ignore: must_be_immutable
class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.colorGrey,
        body: ScreenResponsive(
          body: Column(
            children: [
              const WidgetHeaderNote(),
              AppSize.whit_space_height_8,
              const BodyViewNote(),
              AppSize.whit_space_height_8,
              const WidgetFooterNote(),
            ],
          ),
        ),
      ),
    );
  }
}
