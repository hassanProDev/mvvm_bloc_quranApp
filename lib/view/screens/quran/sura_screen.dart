import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mvvm_islami_app/model/quran/sura_model.dart';
import 'package:mvvm_islami_app/theming/my_theme.dart';
import 'package:mvvm_islami_app/view%20model/quran/sura_cubit.dart';
import 'package:mvvm_islami_app/view/component/core/custom_title.dart';

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
                      title: suraData.suraName,
                      style: Theme.of(context).textTheme.headline3,
                      top: BorderSide(width: 2, color: MyTheming.borderColor),
                      bottom:
                          BorderSide(width: 2, color: MyTheming.borderColor),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: MyTheming.viewColor,
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        margin:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        child: ListView.builder(
                          itemCount: verse.length,
                          itemBuilder: (_, index) => Text(
                            verse[index],
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
        },
      ),
    );
  }
}
