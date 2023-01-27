import 'package:simple_absen/common/app_themes.dart';
import 'package:simple_absen/configs/app_config.dart';
import 'package:simple_absen/features/application/bloc/application_bloc.dart';
import 'package:simple_absen/injector/injector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

import 'router/app_router.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final ApplicationBloc _bloc;
  late String _locale;
  late bool _isDarkMode;
  // late final AppLocalizationDelegate appLocalizationDelegate;

  @override
  void initState() {
    _locale = AppConfig.defaultLocale;
    _bloc = Injector.instance<ApplicationBloc>();
    _bloc.add(const ApplicationLoaded());
    _isDarkMode = false;
    // appLocalizationDelegate = const AppLocalizationDelegate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ApplicationBloc>.value(
          value: _bloc,
        ),
      ],
      child: BlocListener<ApplicationBloc, ApplicationState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state.status == UIStatus.loadSuccess) {
            if (_locale != state.locale) {
              setState(() {
                _locale = state.locale;
              });
            }

            if (_isDarkMode != state.isDarkMode) {
              setState(() {
                _isDarkMode = state.isDarkMode;
              });
            }
          }
        },
        child: MaterialApp.router(
          localizationsDelegates: const [
            // appLocalizationDelegate,
            // GlobalMaterialLocalizations.delegate,
            // GlobalWidgetsLocalizations.delegate,
            // GlobalCupertinoLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate
          ],
          // supportedLocales: appLocalizationDelegate.supportedLocales,
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('th', 'TH'),
            Locale('id', 'ID'),
          ],
          locale: Locale(_locale),
          themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          routeInformationProvider: AppRouter.router.routeInformationProvider,
          routeInformationParser: AppRouter.router.routeInformationParser,
          routerDelegate: AppRouter.router.routerDelegate,
          title: 'BoilerPlate',
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
