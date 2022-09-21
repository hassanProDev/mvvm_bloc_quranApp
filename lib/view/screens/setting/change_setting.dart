import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_islami_app/view%20model/app_theme/app_theme_cubit.dart';
import 'package:mvvm_islami_app/view/component/setting/CustomSettingBtn.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppThemeCubit myCubit = BlocProvider.of(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomSettingBtn(
            name: 'Change theme',
            func: () {
              myCubit.changeTheme();
            },
          ),
        ],
      ),
    );
  }
}
