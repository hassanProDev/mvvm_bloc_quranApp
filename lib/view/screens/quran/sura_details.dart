import 'package:flutter/material.dart';
import 'package:mvvm_islami_app/model/quran/sura_model.dart';
import 'package:mvvm_islami_app/view%20model/quran/quran_view_model.dart';
import 'package:mvvm_islami_app/view/component/quran/sura_item.dart';
import 'package:mvvm_islami_app/view/screens/quran/sura_screen.dart';

import '../../../theming/my_theme.dart';
import '../../component/core/custom_title.dart';

class SuraDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuranViewModel.addSuraData();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          MyTheming.appName,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Column(
        children: [
          Image.asset('assets/images/quranDetails.png'),
          Row(
            children: [
              Expanded(
                child: CustomTitle(
                  title: 'الايات',
                  right: BorderSide(width: 2, color: MyTheming.borderColor),
                  top: BorderSide(width: 2, color: MyTheming.borderColor),
                  bottom: BorderSide(width: 2, color: MyTheming.borderColor),
                ),
              ),
              Expanded(
                child: CustomTitle(
                  title: 'السورة',
                  left: BorderSide(width: 2, color: MyTheming.borderColor),
                  top: BorderSide(width: 2, color: MyTheming.borderColor),
                  bottom: BorderSide(width: 2, color: MyTheming.borderColor),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: QuranViewModel.suraDetailsModel.length,
              itemBuilder: (_, index) => SuraItem(
                suraDetailsModel: QuranViewModel.suraDetailsModel[index],
                func: () {
                  Navigator.pushNamed(context, SuraScreen.routeName,
                      arguments: SuraData(
                          suraName:
                              QuranViewModel.suraDetailsModel[index].suraName,
                          suraIndex: index));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
