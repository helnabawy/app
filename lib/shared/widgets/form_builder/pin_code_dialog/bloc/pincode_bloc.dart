import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'pincode_state.dart';

class PinCodeCubit extends Cubit<PinCodeState> {
  PinCodeCubit() : super(PinCodeInitial());

  resetInput() async {
    emit(ResetInputState(changed: !state.changed));
  }

  openKeyboard() {
    emit(FireKeyboardState(changed: !state.changed));
  }
}
