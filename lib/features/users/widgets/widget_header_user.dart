import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notebook/features/components/cutom_icon.dart';
import 'package:notebook/features/users/bloc/user_bloc.dart';
import 'package:notebook/features/users/bloc/user_event.dart';
import 'package:notebook/features/users/bloc/user_state.dart';
import 'package:notebook/utils/size.dart';
import 'package:notebook/utils/text_style.dart';
import 'package:notebook/utils/widgets_styles.dart';

class WidgetHeaderUser extends StatelessWidget {
  const WidgetHeaderUser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.size_heigh_button_60,
      padding: AppSize.size_symmetric_horizontal_8,
      decoration: AppBoxDecretion.styleBoxDecorationBlack,
      child: Row(children: [
        Spacer(),
        BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if (state is SignUpState) {
            return TextButton(
                onPressed: () {
                  context.read<AuthBloc>().add(SignInEvent());
                },
                child: const Text(
                  "Se connecter",
                  style: AppTextStyles.styleTextWihte,
                ));
          }

          return TextButton(
              onPressed: () {
                context.read<AuthBloc>().add(SignUpEvent());
              },
              child: const Text(
                "Créer compte",
                style: AppTextStyles.styleTextWihteSmall,
              ));
        }),
      ]),
    );
  }
}
