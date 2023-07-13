import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Color color;
  final IconData iconData;
  final void Function() onpressed;
  const CustomIconButton({
    Key? key,
    this.color = Colors.white,
    required this.iconData,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(iconData),
      color: color,
      onPressed: onpressed,
    );
  }
}
