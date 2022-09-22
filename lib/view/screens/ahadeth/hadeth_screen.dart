import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mvvm_islami_app/model/hadeth/hadeth_model.dart';
import 'package:mvvm_islami_app/view/component/core/diplay_content.dart';

import '../../component/core/custom_bg.dart';
import '../../component/core/custom_title.dart';

class HadethScreen extends StatelessWidget {
  static const String routeName = 'hadethScreen';

  @override
  Widget build(BuildContext context) {
    HadethModel hadethModel =
        ModalRoute.of(context)!.settings.arguments as HadethModel;

    return Stack(
      children: [
        CustomBgImg(),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.apptitle,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          body: Column(
            children: [
              CustomTitle(
                hasBoreder: true,
                title: hadethModel.title,
                style: Theme.of(context).textTheme.headline3,
              ),
              DisplayContent(content: hadethModel.content!),
            ],
          ),
        ),
      ],
    );
  }
}
