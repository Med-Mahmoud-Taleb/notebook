import 'package:flutter/material.dart';
import 'package:notebook/utils/size.dart';

class ScreenResponsive extends StatelessWidget {
  final Widget body;
  const ScreenResponsive({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, BoxConstraints boxConstraints) =>
            SingleChildScrollView(
              reverse: true,
              child: ConstrainedBox(
                  constraints:
                      BoxConstraints(maxHeight: boxConstraints.maxHeight),
                  child:
                      Container(padding: AppSize.size_padding_18, child: body)),
            ));
  }
}
