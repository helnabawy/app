import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:qcb/shared/constants/app_constants.dart';
import 'package:qcb/shared/infrastructure/tracking/app_center/app_center_event.dart';
import 'package:qcb/shared/models/generate_otp_response/generate_otp_response.dart';
import 'package:qcb/shared/models/otp_repo.dart';
part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpRepo repo;
  OtpCubit({required this.repo}) : super(OtpInitial());

  generateOtpCode({required String verifierIdentity, AppCenterEventEnum? appCenterEventEnum}) async {
    try {
      emit(LoadingOtpState());
      GenerateOtpResponse response = await repo.generateOtpCode(data: {
        'serviceId': AppConstants.otpServiceId,
        'ApiKey': AppConstants.otpApiKey,
        'socialId': verifierIdentity,
      }, appCenterEventEnum: appCenterEventEnum);
      emit(GenerateOtpLoadedState(generateOtpResponse: response));
    } on PlatformException catch (e) {
      emit(OtpErrorState(message: e.message!));
      rethrow;
    }
  }

  validateOtp(
      {required GenerateOtpResponse data,
      required String pinCode,
      required AppCenterEventEnum appCenterEventEnum}) async {
    try {
      emit(LoadingOtpState());
      bool response = await repo.validateOtpCode(data: {
        'token': data.token,
        'expiresAt': data.expiresAt,
        'ApiKey': AppConstants.otpApiKey,
        'UserOtpCode': pinCode
      }, appCenterEventEnum: appCenterEventEnum);
      emit(ValidateOtpLoadedState(status: response));
    } on PlatformException catch (e) {
      emit(OtpErrorState(message: e.message!));
      rethrow;
    }
  }
}
