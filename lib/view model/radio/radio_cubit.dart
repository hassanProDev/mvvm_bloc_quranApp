import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'radio_state.dart';

class RadioCubit extends Cubit<RadioState> {
  RadioCubit() : super(RadioInitial());
  IconData icon = Icons.play_arrow;

  void changeStatus() {
    icon == Icons.play_arrow ? icon = Icons.pause : icon = Icons.play_arrow;
    emit(StatusChanged());
  }
}
