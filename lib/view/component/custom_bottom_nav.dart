import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mvvm_islami_app/theming/my_theme.dart';

class CustomBottomNavBar extends StatelessWidget {
  int index = 0;
  Function? func;

  CustomBottomNavBar({required this.index, this.func});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: MyTheming.primaryColor,
      ),
      child: BottomNavigationBar(
        selectedItemColor: MyTheming.ayaColor,
        currentIndex: index,
        onTap: (v) {
          func!(v);
        },
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/radio.png')),
            label: AppLocalizations.of(context)!.radio.toUpperCase(),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/sebha.png')),
            label: AppLocalizations.of(context)!.sebha.toUpperCase(),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/ahadeth.png')),
            label: AppLocalizations.of(context)!.ahadeth.toUpperCase(),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/quran.png')),
            label: AppLocalizations.of(context)!.quran.toUpperCase(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: AppLocalizations.of(context)!.setting.toUpperCase(),
          ),
        ],
      ),
    );
  }
}
