import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mvvm_islami_app/model/azkar/azkar_model.dart';
import 'package:mvvm_islami_app/theming/my_theme.dart';
import 'package:mvvm_islami_app/utils/firebase_azkar.dart';
import 'package:mvvm_islami_app/view%20model/sebha/sebha_cubit.dart';

class SebhaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SebhaCubit(),
      child: BlocConsumer<SebhaCubit, SebhaState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          SebhaCubit myCubit = BlocProvider.of(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context)!.apptitle,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(24),
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: SingleChildScrollView(
                      child: StreamBuilder<QuerySnapshot<AzkarModel>>(
                          stream: displayAllAzkar(),
                          builder: (_, snapshot) {
                            List<AzkarModel> azkarModel = snapshot.data?.docs
                                    .map((e) => e.data())
                                    .toList() ??
                                [];
                            myCubit.data = azkarModel;
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            }
                            if (snapshot.hasError) {
                              return Text('you have some error');
                            }
                            if (azkarModel.isNotEmpty) {
                              return Text(
                                '${azkarModel[myCubit.index].zekr}',
                                style: Theme.of(context).textTheme.headline2,
                                textAlign: TextAlign.center,
                              );
                            }
                            return Text('empty');
                          }),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      myCubit.zekrCounter();
                      print(myCubit.index);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset('assets/images/sebhaImg.png'),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: MyTheming.primaryColor,
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: Text(
                              myCubit.counter.toString(),
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
