import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mvvm_islami_app/model/hadeth/hadeth_model.dart';

import '../../../theming/my_theme.dart';
import '../../component/core/custom_title.dart';

class HadethScreen extends StatelessWidget {
  static const String routeName = 'hadethScreen';

  @override
  Widget build(BuildContext context) {
    HadethModel hadethModel =
        ModalRoute.of(context)!.settings.arguments as HadethModel;

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            MyTheming.bgImg,
            fit: BoxFit.fill,
          ),
        ),
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
                title: hadethModel.title,
                style: Theme.of(context).textTheme.headline3,
                top: BorderSide(width: 2, color: MyTheming.borderColor),
                bottom: BorderSide(width: 2, color: MyTheming.borderColor),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: MyTheming.viewColor,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: ListView.builder(
                    itemCount: hadethModel.content!.length,
                    itemBuilder: (_, index) => Text(
                      hadethModel.content![index],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
