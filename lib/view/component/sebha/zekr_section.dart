import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mvvm_islami_app/view%20model/sebha/sebha_cubit.dart';

import '../../../model/azkar/azkar_model.dart';
import '../../../utils/firebase_azkar.dart';

class ZekrSection extends StatelessWidget {
  int index;

  ZekrSection({required this.index});

  @override
  Widget build(BuildContext context) {
    SebhaCubit myCubit = BlocProvider.of(context);
    return StreamBuilder<QuerySnapshot<AzkarModel>>(
      stream: displayAllAzkar(),
      builder: (_, snapshot) {
        List<AzkarModel> azkarModel =
            snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
        myCubit.data = azkarModel;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text(
            AppLocalizations.of(context)!.hasError,
            style: Theme.of(context).textTheme.headline2,
          );
        }
        if (azkarModel.isNotEmpty) {
          return SingleChildScrollView(
            child: Text(
              '${azkarModel[index].zekr}',
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
          );
        }
        return Text(
          AppLocalizations.of(context)!.noData,
          style: Theme.of(context).textTheme.headline2,
        );
      },
    );
  }
}
