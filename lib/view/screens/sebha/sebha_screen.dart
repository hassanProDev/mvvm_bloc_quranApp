import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mvvm_islami_app/view%20model/sebha/sebha_cubit.dart';
import 'package:mvvm_islami_app/view/component/sebha/zekr_counter.dart';
import 'package:mvvm_islami_app/view/component/sebha/zekr_section.dart';

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
                    child: ZekrSection(index: myCubit.index),
                  ),
                  ZekrCounder(
                      counter: myCubit.counter, func: myCubit.zekrCounter),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
