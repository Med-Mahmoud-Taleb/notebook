// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:notebook/data/models/model_users.dart';

abstract class AuthEvent {}

class AuthenticatingEvent extends AuthEvent {}

class AuthenticateEvent extends AuthEvent {
  String username;
  String password;
  AuthenticateEvent({
    required this.username,
    required this.password,
  });
}

class UnAuthenticatedEvent extends AuthEvent {}

class SignInEvent extends AuthEvent {}

class SignUpEvent extends AuthEvent {}

class AddAccountEvent extends AuthEvent {
  String username;
  String password;
  AddAccountEvent({
    required this.username,
    required this.password,
  });
}
