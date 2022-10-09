import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ZekrTextFeild extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  // TextDirection textDirection;

  ZekrTextFeild({
    required this.controller,
    // required this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.rtl,

      style: Theme.of(context).textTheme.headline2,
      // textDirection: textDirection,
      controller: controller,
      validator: (v) {
        if (v!.isEmpty || v == null) {
          return AppLocalizations.of(context)!.validZekr;
        }
        return null;
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
