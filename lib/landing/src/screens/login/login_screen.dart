part of 'login.imports.dart';

class LoginScreen extends StatelessWidget {
  final _loginData = LoginData(repo: LoginRepo());

  LoginScreen({Key? key}) : super(key: key) {
    _loginData.getOAuthUrl();
  }

  @override
  Widget build(BuildContext context) {
    return EventTrackingBaseWidget(
      appCenterEvent: AppCenterEventEnum.LandingLogin,
      child: Scaffold(
          appBar: DefaultAppBar(title: translate('login')),
          body: Column(
            children: [
              BlocBuilder<GenericCubit<bool?>, GenericCubitState<bool?>>(
                  bloc: _loginData.isTopLoaderHiddenCubit,
                  builder: (ctx, state) => state.data == false
                      ? const LinearProgressIndicator(color: AppColors.secondary)
                      : const SizedBox()),
              BlocBuilder<GenericCubit<String?>, GenericCubitState<String?>>(
                  bloc: _loginData.authUrlCubit,
                  builder: (ctx, state) {
                    if (state is GenericInitialState) {
                      return const LinearProgressIndicator(color: AppColors.secondary);
                    } else if (state is GenericUpdatedState) {
                      return Expanded(
                        child: InAppWebView(
                          onLoadStop: (_, __) => _loginData.hideTopLoader(),
                          onUpdateVisitedHistory: (ctrl, uri, isReload) => _loginData.handleUpdateWebHistory(ctx, uri),
                          initialUrlRequest: URLRequest(url: Uri.parse(state.data!)),
                          onReceivedServerTrustAuthRequest: (controller, challenge) async =>
                              ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED),
                        ),
                      );
                    } else if (state is GenericErrorState && state.data!.isEmpty) {
                      return const NoResult();
                    } else {
                      return LoadingDialog.showLoadingView();
                    }
                  }),
            ],
          )),
    );
  }
}
