import 'package:flutter/material.dart';
import 'package:notebook/features/notes/screens/note_screen.dart';
import 'package:notebook/features/users/screens/user_screen.dart';

class RouteGenerate {
  static Route<dynamic> getRoute(RouteSettings settings) {
    var argrs = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const NoteScreen());
      default:
        return MaterialPageRoute(builder: (context) => ErrorR());
    }
  }
}

class ErrorR extends StatefulWidget {
  const ErrorR({super.key});

  @override
  State<ErrorR> createState() => _ErrorRState();
}

class _ErrorRState extends State<ErrorR> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Error"),
      ),
    );
  }
}
