import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  String? title;
  BorderSide top;
  BorderSide bottom;

  TextStyle? style;

  CustomTitle(
      {Key? key,
      this.title,
      this.bottom = BorderSide.none,
      this.top = BorderSide.none,
      this.style})
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
          top: top,
          bottom: bottom,
        ),
      ),
    );
  }
}
