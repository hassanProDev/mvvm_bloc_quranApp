import 'package:flutter/material.dart';

import '../../../theming/my_theme.dart';

class ZekrCounder extends StatelessWidget {
  Function func;
  int counter;

  ZekrCounder({required this.counter, required this.func});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        func();
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/sebhaImg.png'),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: MyTheming.primaryColor,
              ),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                counter.toString(),
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
