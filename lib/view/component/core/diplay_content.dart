import 'package:flutter/material.dart';

import '../../../theming/my_theme.dart';

class DisplayContent extends StatelessWidget {
  List<String> content;

  DisplayContent({required this.content});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: MyTheming.viewColor,
        ),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: ListView.builder(
          itemCount: content.length,
          itemBuilder: (_, index) => Text(
            content[index],
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}
