import 'package:flutter/material.dart';
import 'package:notebook/utils/colors.dart';

class AppTextStyles {
  static const TextStyle styleTextWihte = TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: AppColors.colorWhite,
      letterSpacing: 3);
  static final TextStyle styleTextRed = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: AppColors.colorRed,
      letterSpacing: 3);
  static const TextStyle styleTextWihteSmall = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: AppColors.colorWhite,
      letterSpacing: 2);
  static final TextStyle styleTextBlack = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.grey[850],
      letterSpacing: 2);
  static final TextStyle styleSubTextBlack = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: Colors.grey[850],
      letterSpacing: 3);
  static final TextStyle styleTextBlueGrey = TextStyle(
      fontSize: 13, fontWeight: FontWeight.bold, color: Colors.grey[600]);
}
