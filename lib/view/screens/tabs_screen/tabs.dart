import 'package:flutter/material.dart';
import 'package:mvvm_islami_app/view/screens/setting/change_setting.dart';

import '../ahadeth/ahadeth_details.dart';
import '../quran/sura_details.dart';
import '../radio/radio_screen.dart';
import '../sebha/sebha_screen.dart';

List<Widget> tabs = [
  RadioScreen(),
  SebhaScreen(),
  AhadethDetails(),
  SuraDetails(),
  SettingScreen(),
];
