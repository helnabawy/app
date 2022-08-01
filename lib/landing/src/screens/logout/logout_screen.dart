part of 'logout.imports.dart';

class LogoutScreen extends StatelessWidget {
  final _logoutData = LogoutData(repo: LogoutRepo());

  LogoutScreen({Key? key}) : super(key: key) {
    _logoutData.getOAuthUrl();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<GenericCubit<String?>, GenericCubitState<String?>>(
              bloc: _logoutData.authUrlCubit,
              builder: (ctx, state) {
                if (state is GenericUpdatedState) {
                  return InAppWebView(
                    onLoadStop: (_, uri) => _logoutData.onLoadStop(ctx, uri),
                    initialUrlRequest: URLRequest(url: Uri.parse(state.data!)),
                    onReceivedServerTrustAuthRequest: (controller, challenge) async =>
                        ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED),
                  );
                } else if (state is GenericErrorState && state.data!.isEmpty) {
                  return const NoResult();
                } else {
                  return Container(
                      color: Theme.of(context).appBarTheme.backgroundColor, child: LoadingDialog.showLoadingView());
                }
              }),
          Container(color: Theme.of(context).appBarTheme.backgroundColor, child: LoadingDialog.showLoadingView())
        ],
      ),
    );
  }
}
