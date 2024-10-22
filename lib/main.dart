import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_config_cubit/app_config_cubit.dart';
import 'core/caching/caching_prefs_factory.dart';
import 'core/services_locator/services_locator.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/app_bloc_observer.dart';
import 'features/splash/splash_screen.dart';
import 'generated/l10n.dart';
import 'state_injector.dart';

final navKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  configureDependencies();
  CachingPrefsFactory.getPrefsInstance();
  Bloc.observer = AppBlocObserver();

  runApp(
    const UicApp(),
  );
}

class UicApp extends StatelessWidget {
  const UicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 820),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: StateInjector.blocProviders,
        child: BlocBuilder<AppConfigCubit, AppConfigState>(
          // bloc: context.read<AppConfigCubit>(),
          builder: (context, state) {
            return MaterialApp(
              title: 'United',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: context.read<AppConfigCubit>().currentTheme,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: Locale(context.read<AppConfigCubit>().currentLanguage),
              navigatorKey: navKey,
              home: SplashScreen(
                isDark: state is ChangeTheme
                    ? (state.themeMode == ThemeMode.dark)
                    : false,
              ),
            );
          },
        ),
      ),
    );
  }
}
