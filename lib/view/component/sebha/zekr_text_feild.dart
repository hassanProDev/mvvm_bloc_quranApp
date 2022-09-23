import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ZekrTextFeild extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  Function? func;

  ZekrTextFeild({required this.controller, this.func});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.headline2,
      controller: controller,
      validator: (v) {
        if (v!.isEmpty || v == null) {
          return AppLocalizations.of(context)!.validZekr;
        }
        return null;
      },
      onChanged: (v) {
        func!(v);
      },
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.addZekr,
        hintStyle: Theme.of(context).textTheme.headline2,
        labelStyle: Theme.of(context).textTheme.headline2,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
