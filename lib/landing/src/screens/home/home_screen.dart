part of 'home.imports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeData = HomeData();

  @override
  void initState() {
    super.initState();
    _homeData.init(context: context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (ctx, themeState) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent, statusBarIconBrightness: themeState.props.last as Brightness),
        child: Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            endDrawer: HomeSideMenu(),
            body: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const HomeHeader(),
                    const HomeContent(),
                    Column(
                      children: [
                        HomeActionButtons(loginCallback: _homeData.onLogin),
                        Container(height: 2, color: AppColors.primary),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Text(translate('home_micro_apps_slug'), style: Theme.of(context).textTheme.subtitle1),
                        ),
                        VerificationMenu(homeData: _homeData)
                      ],
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
