// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:notebook/utils/widgets_styles.dart';

class CustomTextField extends StatelessWidget {
  final controller;
  final focusNode;
  final String hintText;
  final bool obscureText;
  final TextInputType textInputType;
  final int maxLines;
  final String? Function(String? value)? validator;
  const CustomTextField({
    Key? key,
    this.controller,
    required this.hintText,
    required this.obscureText,
    this.textInputType = TextInputType.multiline,
    this.maxLines = 1,
    this.validator,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecretion.styleBoxDecorationWithe,
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        focusNode: focusNode,
        // minLines: 1,
        maxLines: maxLines,
        obscureText: obscureText,
        // textInputAction: TextInputAction.done,
        textInputAction: TextInputAction.newline,
        validator: validator,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            border: const OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}
