import 'package:flutter/material.dart';

import '../../../theming/my_theme.dart';

class CustomBgImg extends StatelessWidget {
  const CustomBgImg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        MyTheming.bgImg,
        fit: BoxFit.fill,
      ),
    );
  }
}
