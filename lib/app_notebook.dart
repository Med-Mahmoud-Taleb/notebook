import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notebook/core/local/sqlite_db.dart';
import 'package:notebook/data/repositories/notes/repo_notes_local.dart';
import 'package:notebook/data/repositories/users/rep_users_local.dart';
import 'package:notebook/features/notes/bloc/map_event_to_state_note.dart';
import 'package:notebook/features/notes/bloc/note_bloc.dart';
import 'package:notebook/features/notes/screens/note_screen.dart';
import 'package:notebook/features/users/bloc/user_bloc.dart';
import 'package:notebook/routers/routers.dart';

class AppNoteBook extends StatelessWidget {
  const AppNoteBook({super.key});
  static final _sql = SqltiDB();
  static final mapEvent = MapEventToStateNote(
    noteRepositoryLocal: NoteRepositoryLocal(
      sqltiDB: _sql,
    ),
  );
  static final _rep_user = UserRepositoryLocal(
    sqltiDB: _sql,
  );
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable

    return MultiBlocProvider(
        providers: [
          BlocProvider<NoteBloc>(
            create: (context) => NoteBloc(mapEvent),
          ),
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(_rep_user),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerate.getRoute,
          title: 'Notebook',
          theme: ThemeData(
            primarySwatch: Colors.grey,
          ),
        ));
  }
}
