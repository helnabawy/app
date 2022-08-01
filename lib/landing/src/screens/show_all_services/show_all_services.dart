part of 'show_all_services.imports.dart';

class ShowAllServicesScreen extends StatefulWidget {
  final List<MenuItemModel> verificationMenu;
  final String? title;
  final bool fromTabs;
  final AppCenterEventEnumBase appCenterEventEnum;

  ShowAllServicesScreen(
      {required this.verificationMenu, this.title, this.fromTabs = false, required this.appCenterEventEnum});

  @override
  State<ShowAllServicesScreen> createState() => _ShowAllServicesScreenState();
}

class _ShowAllServicesScreenState extends State<ShowAllServicesScreen> {
  ShowAllServicesData showAllServicesData = ShowAllServicesData();

  @override
  void initState() {
    super.initState();
    showAllServicesData.init(context: context, verificationMenu: widget.verificationMenu);
  }

  @override
  Widget build(BuildContext context) {
    return EventTrackingBaseWidget(
      appCenterEvent: widget.appCenterEventEnum,
      child: Scaffold(
        appBar: DefaultAppBar(
          title: widget.title ?? translate('verification_services'),
          hideBackButton: widget.fromTabs,
        ),
        body: (widget.verificationMenu.isNotEmpty)
            ? ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                itemBuilder: (BuildContext context, int index) {
                  MenuItemModel menuItemModel = showAllServicesData.menuList[index];
                  return ServiceItem(
                    menuItemModel: menuItemModel,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(color: Colors.grey.withOpacity(0.5));
                },
                itemCount: showAllServicesData.menuList.length -
                    (showAllServicesData.menuList.isNotEmpty &&
                            showAllServicesData.menuList.last.route == 'showAllServices'
                        ? 1
                        : 0))
            : Container(),
      ),
    );
  }
}
