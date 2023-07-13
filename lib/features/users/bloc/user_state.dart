// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:notebook/data/models/model_message_error.dart';

abstract class AuthState {}

class InitialAuthState extends AuthState {}

class AuthenticatingState extends AuthState {}

class AuthenticatedState extends AuthState {}

class UnAuthenticatedState extends AuthState {
  MessageError message;
  UnAuthenticatedState({
    required this.message,
  });
}

class SignInState extends AuthState {
  MessageError? message;
  SignInState({
    this.message,
  });
}

class SignUpState extends AuthState {}

class AddedAccoutSate extends AuthState {}
