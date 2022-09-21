import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ahadeth_state.dart';

class AhadethCubit extends Cubit<AhadethState> {
  AhadethCubit() : super(AhadethInitial());
}
