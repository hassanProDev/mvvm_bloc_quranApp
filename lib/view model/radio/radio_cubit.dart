import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mvvm_islami_app/data/remote/radio_api.dart';

import '../../model/radio/radio_model.dart';

part 'radio_state.dart';

class RadioCubit extends Cubit<RadioState> {
  RadioCubit() : super(RadioInitial());
  IconData icon = Icons.play_arrow;

  void changeStatus() {
    icon == Icons.play_arrow ? icon = Icons.pause : icon = Icons.play_arrow;
    emit(StatusChanged());
  }
//
// Future<RadioModel> fetchData() async {
//   var url = Uri.https(baseUrl, radioEndPoint,{});
//   var response = await http.get(url);
//   var responseBody = response.body;
//   var json = jsonDecode(responseBody);
//   return RadioModel.fromJson(json);
// }
}
