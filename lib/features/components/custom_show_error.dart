import 'package:flutter/material.dart';
import 'package:notebook/utils/text_style.dart';
import 'package:notebook/utils/widgets_styles.dart';

class CustomWidgetShowhError extends StatelessWidget {
  const CustomWidgetShowhError({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: AppBoxDecretion.styleBoxDecorationWithe,
        width: double.infinity,
        child: Center(
          child: Text(
            "Aucune note",
            style: AppTextStyles.styleTextBlack,
          ),
        ),
      ),
    );
  }
}
