import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mekanik_event.dart';
part 'mekanik_state.dart';

class MekanikBloc extends Bloc<MekanikEvent, MekanikState> {
  MekanikBloc() : super(MekanikInitial()) {
    on<MekanikEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
