import 'package:qcb/shared/infrastructure/network/network.imports.dart';
import 'package:qcb/shared/infrastructure/tracking/app_center/app_center_event.dart';
import 'package:qcb/shared/models/generate_otp_response/generate_otp_response.dart';

class OtpRepo {
  Future<GenerateOtpResponse> generateOtpCode(
      {required Map<String, dynamic> data, AppCenterEventEnum? appCenterEventEnum}) async {
    try {
      GenerateOtpResponse generateOtpResponse = await Network().httpClient.callApi<GenerateOtpResponse>(
          endpoint: 'endpoint',
          headers: {},
          returnType: ReturnType.Model,
          returnDataFun: (data) => data,
          json: data,
          toJsonFunc: (json) => GenerateOtpResponse.fromJson(json),
          methodType: MethodType.Post);
      return generateOtpResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> validateOtpCode(
      {required Map<String, dynamic> data, required AppCenterEventEnum appCenterEventEnum}) async {
    try {
      bool response = await Network().httpClient.callApi<bool>(
          endpoint: 'endpoint',
          headers: {},
          returnType: ReturnType.Type,
          returnDataFun: (data) => data,
          json: data,
          methodType: MethodType.Post);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
