import 'package:flutter/material.dart';
import 'package:mvvm_islami_app/view/screens/setting/change_setting.dart';

import '../ahadeth/ahadeth_details.dart';
import '../quran/sura_details.dart';
import '../sebha/sebha_screen.dart';

List<Widget> tabs = [
  SuraDetails(),
  SebhaScreen(),
  AhadethDetails(),
  SuraDetails(),
  SettingScreen(),
];
