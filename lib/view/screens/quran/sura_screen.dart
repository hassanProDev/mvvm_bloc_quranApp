import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mvvm_islami_app/model/quran/sura_model.dart';
import 'package:mvvm_islami_app/view%20model/quran/sura_cubit.dart';
import 'package:mvvm_islami_app/view/component/core/custom_title.dart';
import 'package:mvvm_islami_app/view/component/core/diplay_content.dart';

import '../../component/core/custom_bg.dart';

class SuraScreen extends StatelessWidget {
  static const String routeName = 'suraScreen';

  @override
  Widget build(BuildContext context) {
    SuraData suraData = ModalRoute.of(context)!.settings.arguments as SuraData;
    return BlocProvider(
      create: (context) => SuraCubit(),
      child: BlocConsumer<SuraCubit, SuraState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          SuraCubit suraCubit = BlocProvider.of(context);
          suraCubit.loadFile(suraData.suraIndex);
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
                      title: suraData.suraName,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    DisplayContent(content: verse),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
