import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mvvm_islami_app/view%20model/app_theme/app_theme_cubit.dart';
import 'package:mvvm_islami_app/view/component/setting/CustomSettingBtn.dart';
import 'package:mvvm_islami_app/view/screens/sebha/azkar_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppThemeCubit myCubit = BlocProvider.of(context);

    return BlocConsumer<AppThemeCubit, AppThemeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSettingBtn(
                name: myCubit.isDark
                    ? AppLocalizations.of(context)!.lightMode.toUpperCase()
                    : AppLocalizations.of(context)!.darkMode.toUpperCase(),
                func: () {
                  myCubit.changeTheme();
                },
              ),
              CustomSettingBtn(
                name: AppLocalizations.of(context)!.lang.toUpperCase(),
                func: () {
                  myCubit.changeLang();
                },
              ),
              CustomSettingBtn(
                name: AppLocalizations.of(context)!.addZekr.toUpperCase(),
                func: () {
                  Navigator.pushNamed(context, AzkarScreen.routeName);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
