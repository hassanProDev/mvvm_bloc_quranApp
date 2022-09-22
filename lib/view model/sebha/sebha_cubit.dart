import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mvvm_islami_app/model/azkar/azkar_model.dart';

part 'sebha_state.dart';

class SebhaCubit extends Cubit<SebhaState> {
  SebhaCubit() : super(SebhaInitial());
  int index = 0;
  int counter = 0;
  List<AzkarModel> data = [];

  void zekrCounter() {
    if (counter < 31) {
      counter++;
    } else {
      counter = 1;
      if (index < data.length - 1) {
        index++;
      } else {
        index = 0;
      }
    }
    print(index);
    emit(SebhaCounter());
  }
}
