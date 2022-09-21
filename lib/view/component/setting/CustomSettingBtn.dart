import 'package:flutter/material.dart';
import 'package:mvvm_islami_app/theming/my_theme.dart';

class CustomSettingBtn extends StatelessWidget {
  String? name;
  Function? func;

  CustomSettingBtn({this.name, this.func});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16),
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: MyTheming.primaryColor),
        child: Text(
          name!,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      onTap: () {
        func!();
      },
    );
  }
}
