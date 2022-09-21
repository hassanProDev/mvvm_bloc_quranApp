import 'package:flutter/material.dart';

import '../../../model/quran/sura_model.dart';
import '../core/custom_title.dart';

class SuraItem extends StatelessWidget {
  SuraDetailsModel? suraDetailsModel;
  VoidCallback? func;

  SuraItem({Key? key, this.suraDetailsModel, this.func}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        func!();
      },
      child: Row(
        children: [
          Expanded(
            child: CustomTitle(
              title: '${suraDetailsModel!.ayatCount}',
              // right: reusedBorder,
            ),
          ),
          Expanded(
            child: CustomTitle(
              title: '${suraDetailsModel!.suraName}',
            ),
          ),
        ],
      ),
    );
  }
}
