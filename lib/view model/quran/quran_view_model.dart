import '../../data/local/sura_data.dart';
import '../../model/quran/sura_model.dart';

class QuranViewModel {
  static List<SuraDetailsModel> suraDetailsModel = [];

  static void addSuraData() {
    if (suraDetailsModel.isEmpty) {
      for (int i = 0; i < suraName.length; i++) {
        suraDetailsModel.add(
          SuraDetailsModel(
            suraName: suraName[i],
            ayatCount: ayatCount[i],
          ),
        );
      }
    }
  }
}
