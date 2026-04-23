import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'barang_event.dart';
part 'barang_state.dart';

class BarangBloc extends Bloc<BarangEvent, BarangState> {
  BarangBloc() : super(BarangInitial()) {
    on<BarangEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
