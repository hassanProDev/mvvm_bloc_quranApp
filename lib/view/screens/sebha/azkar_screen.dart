import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mvvm_islami_app/model/azkar/azkar_model.dart';
import 'package:mvvm_islami_app/utils/firebase_azkar.dart';
import 'package:mvvm_islami_app/view/component/core/custom_bg.dart';
import 'package:mvvm_islami_app/view/component/sebha/view_all_zekr.dart';
import 'package:mvvm_islami_app/view/component/setting/CustomSettingBtn.dart';

import '../../component/sebha/zekr_text_feild.dart';

class AzkarScreen extends StatelessWidget {
  static const String routeName = 'azkarScreen';
  TextEditingController zekr = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                Expanded(
                  child: StreamBuilder<QuerySnapshot<AzkarModel>>(
                    stream: displayAllAzkar(),
                    builder: (_, snapshot) {
                      List<AzkarModel> azkarModel =
                          snapshot.data?.docs.map((e) => e.data()).toList() ??
                              [];
                      return ViewAllZekr(azkarModel: azkarModel);
                    },
                  ),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      ZekrTextFeild(
                        controller: zekr,
                        func: (v) {
                          zekr.text = v;
                        },
                      ),
                      CustomSettingBtn(
                        name:
                            AppLocalizations.of(context)!.addZekr.toUpperCase(),
                        func: () {
                          if (formKey.currentState!.validate()) {
                            addNewZekr(AzkarModel(id: '', zekr: zekr.text));
                          }
                          zekr.text = '';
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
