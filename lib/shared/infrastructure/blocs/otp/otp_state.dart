part of 'otp_bloc.dart';

abstract class OtpState extends Equatable {}

class OtpInitial extends OtpState {
  @override
  List<Object> get props => [];
}

class LoadingOtpState extends OtpState {
  @override
  List<Object> get props => [];
}

class GenerateOtpLoadedState extends OtpState {
  final GenerateOtpResponse generateOtpResponse;
  GenerateOtpLoadedState({required this.generateOtpResponse});
  @override
  List<Object> get props => [generateOtpResponse];
}

class ValidateOtpLoadedState extends OtpState {
  final bool status;
  ValidateOtpLoadedState({required this.status});
  @override
  List<Object> get props => [status];
}

class OtpErrorState extends OtpState {
  final String message;
  OtpErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
