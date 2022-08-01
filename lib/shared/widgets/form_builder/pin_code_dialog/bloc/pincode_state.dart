part of 'pincode_bloc.dart';

abstract class PinCodeState extends Equatable {
  final bool changed;
  PinCodeState({required this.changed});
}

class PinCodeInitial extends PinCodeState {
  PinCodeInitial() : super(changed: false);
  @override
  List<Object> get props => [changed];
}

class ResetInputState extends PinCodeState {
  ResetInputState({required bool changed}) : super(changed: changed);
  @override
  List<Object> get props => [changed];
}

class FireKeyboardState extends PinCodeState {
  FireKeyboardState({required bool changed}) : super(changed: changed);
  @override
  List<Object> get props => [changed];
}
