import 'package:flutter/material.dart';
import 'package:notebook/utils/colors.dart';
import 'package:notebook/utils/size.dart';
import 'package:notebook/utils/text_style.dart';
import 'package:notebook/utils/widgets_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onpressed,
    required this.title,
  });
  final String title;
  final void Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: onpressed,
        // ignore: sort_child_properties_last
        child: Text(title, style: AppTextStyles.styleTextRed),
        style: AppStyleButton.styleButton,
      ),
    );
  }
}
