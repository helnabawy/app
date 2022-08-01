part of 'app.imports.dart';

class QCBApp extends StatefulWidget {
  const QCBApp({Key? key}) : super(key: key);

  @override
  State<QCBApp> createState() => _QCBAppState();
}

class _QCBAppState extends State<QCBApp> with WidgetsBindingObserver {
  final navigatorKey = GlobalKey<NavigatorState>();

  final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();

    PushNotificationHandler.instance.setupNotification(context);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => LangCubit()),
          BlocProvider(create: (BuildContext context) => ThemeCubit()),
          BlocProvider(create: (BuildContext context) => InternetConnectionCubit()),
          BlocProvider(create: (BuildContext context) => UserCubit()),
          BlocProvider(create: (BuildContext context) => MenuCubit()),
          BlocProvider(create: (BuildContext context) => MicroAppCubit()),
          BlocProvider(create: (BuildContext context) => ConfigCubit()),
          BlocProvider(create: (BuildContext context) => PinCodeCubit()),
        ],
        child: BlocBuilder<LangCubit, LangState>(
          builder: (context, languageState) {
            return BlocBuilder<ThemeCubit, ThemeState>(
              builder: (ctx, themeState) {
                ThemeService.changeTheme(context: ctx, makeDark: AppStorage.isDarkThemeEnabled);
                return MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    theme: AppThemes.lightTheme,
                    darkTheme: AppThemes.darkTheme,
                    themeMode: ctx.read<ThemeCubit>().state.theme,
                    title: AppConstants.appName,
                    supportedLocales: const [
                      Locale('ar', 'SA'),
                      Locale('en', 'US'),
                    ],
                    localizationsDelegates: [
                      LocalizationService.localizationsDelegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    locale: languageState.locale,
                    routerDelegate: _appRouter.delegate(initialRoutes: [const HomeScreenRoute()]),
                    routeInformationParser: _appRouter.defaultRouteParser(),
                    builder: (ctx, child) => FlutterEasyLoading(child: child));
              },
            );
          },
        ));
  }
}
