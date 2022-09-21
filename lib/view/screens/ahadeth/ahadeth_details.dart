import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mvvm_islami_app/model/hadeth/hadeth_model.dart';
import 'package:mvvm_islami_app/view%20model/ahadeth/ahadeth_cubit.dart';
import 'package:mvvm_islami_app/view/component/core/custom_title.dart';
import 'package:mvvm_islami_app/view/screens/ahadeth/hadeth_screen.dart';

import '../../../theming/my_theme.dart';

class AhadethDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AhadethCubit(),
      child: BlocConsumer<AhadethCubit, AhadethState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          AhadethCubit myCubit = BlocProvider.of(context);
          myCubit.loadHadeth();
          return Scaffold(
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context)!.apptitle,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            body: Column(
              children: [
                CustomTitle(
                  top: BorderSide(width: 2, color: MyTheming.borderColor),
                  bottom: BorderSide(width: 2, color: MyTheming.borderColor),
                  title: 'الاحاديث',
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: myCubit.hadethModel.length,
                    itemBuilder: (_, index) => InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          HadethScreen.routeName,
                          arguments: HadethModel(
                              title: myCubit.hadethModel[index].title,
                              content: myCubit.hadethModel[index].content),
                        );
                      },
                      child: Text(
                        '${myCubit.hadethModel[index].title}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
