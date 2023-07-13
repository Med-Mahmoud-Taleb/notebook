import 'package:flutter/material.dart';
import 'package:notebook/features/components/screen_responsive.dart';
import 'package:notebook/features/users/widgets/widget_form_user.dart';
import 'package:notebook/features/users/widgets/widget_header_user.dart';
import 'package:notebook/utils/colors.dart';
import 'package:notebook/utils/size.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.colorGrey,
            body: ScreenResponsive(
                body: Column(
              children: [
                const WidgetHeaderUser(),
                AppSize.whit_space_height_8,
                const WidgetFormUser(),
              ],
            ))));
  }
}
