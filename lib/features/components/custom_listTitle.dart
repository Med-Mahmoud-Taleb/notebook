// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:notebook/utils/text_style.dart';
import 'package:notebook/utils/widgets_styles.dart';

class CustuomListTilte extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget? trailing;
  final VoidCallback? onpressed;
  const CustuomListTilte(
      {Key? key,
      required this.title,
      required this.subTitle,
      this.onpressed,
      this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecretion.styleBoxDecorationWithe,
      child: ListTile(
        onTap: onpressed,
        title: Text(
          maxLines: 1,
          softWrap: false,
          title,
          style: AppTextStyles.styleTextBlack,
        ),
        subtitle: Text(
          subTitle,
          style: AppTextStyles.styleSubTextBlack,
        ),
        trailing: trailing,
      ),
    );
  }
}
