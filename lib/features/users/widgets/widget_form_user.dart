import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notebook/features/components/custom_button.dart';
import 'package:notebook/features/components/custom_field.dart';
import 'package:notebook/features/users/bloc/user_bloc.dart';
import 'package:notebook/features/users/bloc/user_event.dart';
import 'package:notebook/features/users/bloc/user_state.dart';
import 'package:notebook/utils/size.dart';

import 'widget_dialog_error_user.dart';

class WidgetFormUser extends StatefulWidget {
  const WidgetFormUser({
    Key? key,
  }) : super(key: key);

  @override
  State<WidgetFormUser> createState() => _WidgetFormUserState();
}

class _WidgetFormUserState extends State<WidgetFormUser> {
  late TextEditingController usernameController,
      passwordController,
      confirmPasswordController;
  final _formKey = GlobalKey<FormState>();
  final _focusNode1 = FocusNode();
  final _focusNode2 = FocusNode();
  final _focusNode3 = FocusNode();
  @override
  void initState() {
    context.read<AuthBloc>().add(AuthenticatingEvent());
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _icon(),
            _fieldUserName(),
            AppSize.whit_space_height_8,
            _fieldPassword(),
            AppSize.whit_space_height_8,
            _fieldConfirmPassword(),
            AppSize.whit_space_height_8,
            _buttonSubmit(context)
          ],
        ),
      ),
    );
  }

  BlocListener<AuthBloc, AuthState> _buttonSubmit(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(listener: (context, state) {
      if (state is AuthenticatedState) {
        Navigator.pushReplacementNamed(context, '/NoteScreen');
      }
      if (state is UnAuthenticatedState) {
        showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return WidgetDialogErrorUser(
                message: state.message,
              );
            });
      }
      if (state is SignInState) {
        if (state.message != null) {
          showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return WidgetDialogErrorUser(
                  message: state.message!,
                );
              });
        }
      }
    }, child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return CustomButton(
          onpressed: () {
            if (_formKey.currentState!.validate()) {
              if (state is SignUpState) {
                context.read<AuthBloc>().add(AddAccountEvent(
                      username: usernameController.text,
                      password: passwordController.text.trim(), //delete space
                    ));
              } else {
                context.read<AuthBloc>().add(AuthenticateEvent(
                      username: usernameController.text,
                      password: passwordController.text.trim(), //delete space
                    ));
              }
              _focusNode1.unfocus();
              _focusNode2.unfocus();
              _focusNode3.unfocus();
              usernameController.text = '';
              passwordController.text = '';
              confirmPasswordController.text = '';
            }
          },
          title: titleButton(state));
    }));
  }

  BlocBuilder<AuthBloc, AuthState> _fieldConfirmPassword() {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is SignUpState) {
        return CustomTextField(
          controller: confirmPasswordController,
          focusNode: _focusNode3,
          hintText: 'Confirmer le mot de passe',
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Remplir le champ';
            }
            if (value != passwordController.text) {
              return 'Le mot de passe doit être le même que ci-dessus';
            }
            return null;
          },
        );
      }
      return Container();
    });
  }

  CustomTextField _fieldPassword() => CustomTextField(
        controller: passwordController,
        focusNode: _focusNode2,
        hintText: 'Mot de passe',
        obscureText: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Remplir le champ';
          }
          return null;
        },
      );

  CustomTextField _fieldUserName() {
    return CustomTextField(
      controller: usernameController,
      focusNode: _focusNode1,
      hintText: "Nom d'utilisateur",
      obscureText: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Remplir le champ';
        }
        return null;
      },
    );
  }

  Expanded _icon() {
    return Expanded(
      child: Container(
        child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if (state is SignUpState) {
            return const Icon(
              Icons.person_add,
              size: 90,
            );
          }

          return const Icon(
            Icons.lock,
            size: 90,
          );
        }),
      ),
    );
  }

  String titleButton(AuthState state) {
    if (state is SignUpState) {
      return "Engistrer";
    }
    return "Connecter";
  }
}
