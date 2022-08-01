part of 'models.imports.dart';

class HomeRepo {
  static Future<MenuTypesModel> getMenus({bool refresh = true}) async {
    try {
      final response = await Network().httpClient.callApi<Map<String, dynamic>>(
            endpoint: AppEnvironment.menuEndPoint.value,
            returnType: ReturnType.Type,
            refresh: refresh,
            appCenterEvent: AppCenterEventEnum.LoadVerificationMenu,
            returnDataFun: (data) => AESDecryptor.decrypt(data),
            methodType: MethodType.Get,
          );

      return MenuTypesModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<IonicMicroApp>> getMicroApps() async {
    try {
      final response = await Network().httpClient.callApi<List>(
            endpoint: AppEnvironment.microAppEndPoint.value,
            returnType: ReturnType.Type,
            appCenterEvent: AppCenterEventEnum.LoadMicroApps,
            returnDataFun: (data) => AESDecryptor.decryptApps(data),
            toJsonFunc: (json) => IonicMicroApp.fromJson(json),
            methodType: MethodType.Get,
          );
      return response
          .map((e) => IonicMicroApp(
              name: e['name'],
              title: e['title'],
              url: e['url'],
              version: e['version'],
              additionalData: e['additionalData']))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<PrivacyAndTermsModel> getPrivacyPolicyAndUsageTerms({bool refresh = true}) async {
    try {
      final response = await Network().httpClient.callApi<PrivacyAndTermsModel>(
            endpoint: ApiEndpoints.policies.value,
            returnType: ReturnType.Model,
            appCenterEvent: AppCenterEventEnum.LoadingPrivacyPolicy,
            refresh: refresh,
            returnDataFun: (data) => data,
            toJsonFunc: (json) => PrivacyAndTermsModel.fromJson(json),
            methodType: MethodType.Get,
          );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<AppConfig?> getConfigurations() async {
    try {
      final response = await Network().httpClient.callApi<Map<String, dynamic>>(
            endpoint: AppEnvironment.configurationEndPoint.value,
            returnType: ReturnType.Type,
            refresh: false,
            appCenterEvent: AppCenterEventEnum.LoadCondig,
            returnDataFun: (data) => AESDecryptor.decrypt(data),
            methodType: MethodType.Get,
          );

      return AppConfig.fromJson(response);
    } on DioError catch (_) {
      rethrow;
    }
  }
}
