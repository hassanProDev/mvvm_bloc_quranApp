import 'package:flutter/material.dart';

import '../../../theming/my_theme.dart';

class CustomTitle extends StatelessWidget {
  String? title;
  TextStyle? style;
  bool hasBoreder;

  CustomTitle({Key? key, required this.hasBoreder, this.title, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        '$title',
        style: style ?? Theme.of(context).textTheme.headline2,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: hasBoreder
              ? BorderSide(width: 2, color: MyTheming.borderColor)
              : BorderSide.none,
          bottom: hasBoreder
              ? BorderSide(width: 2, color: MyTheming.borderColor)
              : BorderSide.none,
        ),
      ),
    );
  }
}
