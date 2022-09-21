import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import '../../model/quran/sura_model.dart';

part 'sura_state.dart';

class SuraCubit extends Cubit<SuraState> {
  SuraCubit() : super(SuraInitial());

  void loadFile(index) async {
    String content =
        await rootBundle.loadString('assets/sura/${index + 1}.txt');
    content.split('\n');
    List<String> lines = [];
    lines.add(content);
    verse = lines[0].split('\n');
    emit(SuraInitial());
  }
}
