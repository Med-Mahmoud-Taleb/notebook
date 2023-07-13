import 'package:flutter/material.dart';
import 'package:notebook/utils/colors.dart';

class AppBoxDecretion {
  static const BoxDecoration styleBoxDecorationWithe = BoxDecoration(
      color: AppColors.colorWhite,
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ));

  static final BoxDecoration styleBoxDecorationBlack = BoxDecoration(
      color: AppColors.colorGreyWihBlack,
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ));
}

class AppIcons {
  static const IconData iconModeEdit = Icons.mode_edit;
  static const IconData iconNetwork = Icons.network_check_outlined;

  static const IconData add_icon = Icons.add;
  static const IconData delete_icon = Icons.delete;
}

class AppStyleButton {
  static var styleButton = ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );
}
