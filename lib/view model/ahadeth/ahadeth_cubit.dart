import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import '../../model/hadeth/hadeth_model.dart';

part 'ahadeth_state.dart';

class AhadethCubit extends Cubit<AhadethState> {
  AhadethCubit() : super(AhadethInitial());
  List<HadethModel> hadethModel = [];

  void loadHadeth() async {
    String content = await rootBundle.loadString('assets/sura/ahadeth.txt');
    List<String> ahadeth = content.split('#\r\n');
    if (hadethModel.isEmpty) {
      for (int i = 0; i < ahadeth.length; i++) {
        String allHadeth = ahadeth[i];
        List<String> lines = allHadeth.split('\n');
        String title = lines[0];
        lines.removeAt(0);
        hadethModel.add(HadethModel(title: title, content: lines));
      }
    }

    emit(AhadethInitial());
  }
}
