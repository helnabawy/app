part of '../home.imports.dart';

class VerificationMenu extends StatelessWidget {
  final bool isLoading = true;
  final HomeData homeData;
  VerificationMenu({Key? key, required this.homeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        height: 130,
        child: BlocConsumer<MenuCubit, MenuState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is MenuUpdateState) {
              if (state.menus!.verificationMenu != null) {
                return ListView.builder(
                    itemCount: state.menus!.verificationMenu!.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      MenuItemModel item = state.menus!.verificationMenu![index];
                      if (item.showInHomePage as bool) {
                        return VerificationItem(
                            menuItemModel: item, index: index, verificationMenu: state.menus!.verificationMenu!);
                      } else {
                        return Container();
                      }
                    });
              } else {
                return Center(
                  child: AppText.normal(translate('no_result')),
                );
              }
            } else if (state is MenuErrorState) {
              return Center(
                child: AppText.normal(translate(state.responseError!.message)),
              );
            } else {
              return LoadingDialog.showLoadingView();
            }
          },
        ));
  }
}
