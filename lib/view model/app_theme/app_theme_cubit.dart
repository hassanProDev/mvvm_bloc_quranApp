import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mvvm_islami_app/theming/my_theme.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeInitial());
  int index = 0;

  changeTabs(int index) {
    this.index = index;
    emit(ChangeTabs());
  }

  bool isDark = false;
  String themeMode = 'dark';
  String lang = 'ar';

  void changeLang() {
    lang == 'ar' ? lang = 'en' : lang = 'ar';
    emit(ChangeLang());
  }

  void changeTheme() {
    emit(AppThemeInitial());
    isDark == false ? isDark = true : isDark = false;
    emit(AppThemeChanged());
    themeMode == 'dark' ? themeMode = 'light' : themeMode = 'dark';
    emit(AppThemeChanged());
    MyTheming.ayaColor == Color(0xff242424)
        ? MyTheming.ayaColor = Color(0xffFACC1D)
        : MyTheming.ayaColor = Color(0xff242424);
    MyTheming.viewColor == Color(0xffF8F8F8)
        ? MyTheming.viewColor = Color(0xff141A2E)
        : MyTheming.viewColor = Color(0xffF8F8F8);

    MyTheming.primaryColor == Color(0xffB7935F)
        ? MyTheming.primaryColor = Color(0xff141A2E)
        : MyTheming.primaryColor = Color(0xffB7935F);

    MyTheming.bgImg == 'assets/images/bg3.png'
        ? MyTheming.bgImg = 'assets/images/dark_bg.png'
        : MyTheming.bgImg = 'assets/images/bg3.png';

    MyTheming.borderColor == Color(0xffB7935F)
        ? MyTheming.borderColor = Color(0xffFACC1D)
        : MyTheming.borderColor = Color(0xffB7935F);

    emit(AppColorChanged());
  }
}
