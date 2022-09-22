import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_islami_app/view%20model/app_theme/app_theme_cubit.dart';
import 'package:mvvm_islami_app/view/component/custom_bottom_nav.dart';
import 'package:mvvm_islami_app/view/screens/tabs_screen/tabs.dart';

import '../component/core/custom_bg.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'homeLayout';

  @override
  Widget build(BuildContext context) {
    AppThemeCubit myCubit = BlocProvider.of(context);
    return SafeArea(
      child: Stack(
        children: [
          CustomBgImg(),
          Scaffold(
            body: tabs[myCubit.index],
            backgroundColor: Colors.transparent,
            bottomNavigationBar: CustomBottomNavBar(
              index: myCubit.index,
              func: (v) {
                myCubit.changeTabs(v);
              },
            ),
          ),
        ],
      ),
    );
  }
}
