// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notebook/data/repositories/users/rep_users_local.dart';
import 'package:notebook/features/users/bloc/user_event.dart';
import 'package:notebook/features/users/bloc/user_state.dart';
import 'package:notebook/utils/messages_errors.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UserRepositoryLocal userRepositoryLocal;
  AuthBloc(
    this.userRepositoryLocal,
  ) : super(InitialAuthState());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    yield AuthenticatingState();

    if (event is AuthenticatingEvent) {
      yield SignInState();
    }
    if (event is SignUpEvent) {
      yield SignUpState();
    }
    if (event is AuthenticateEvent) {
      final checkUsername =
          await userRepositoryLocal.checkUserName(event.username);
      if (checkUsername == null) {
        yield UnAuthenticatedState(message: ApppMessage.message_no_account);
      } else {
        final response = await userRepositoryLocal.authUser(
            username: event.username, password: event.password);
        print(" Auth : $response");
        if (response != null) {
          yield AuthenticatedState();
        } else {
          yield UnAuthenticatedState(message: ApppMessage.message_auth);
        }
      }
    }
    if (event is SignInEvent) {
      yield SignInState();
    }

    if (event is AddAccountEvent) {
      final checkUsername =
          await userRepositoryLocal.checkUserName(event.username);
      if (checkUsername != null) {
        yield UnAuthenticatedState(message: ApppMessage.message_have_account);
      } else {
        await userRepositoryLocal.addUser(
            username: event.username, password: event.password);

        yield SignInState(message: ApppMessage.message_added_account);
      }
    }
  }
}
