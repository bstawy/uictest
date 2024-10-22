import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/theme/app_theme.dart';
import 'cubit/app_config_cubit.dart';
import 'features/splash/splash_screen.dart';

final navKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(
    BlocProvider(
      create: (context) => AppConfigCubit()..getTheme(),
      child: const UicApp(),
    ),
  );
}

class UicApp extends StatelessWidget {
  const UicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppConfigCubit, AppConfigState>(
      bloc: context.read<AppConfigCubit>(),
      builder: (context, state) {
        return ScreenUtilInit(
          designSize: const Size(375, 820),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => MaterialApp(
            title: 'United',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode:
                state is ChangeTheme ? state.themeMode : ThemeMode.system,
            navigatorKey: navKey,
            home: const SplashScreen(),
          ),
        );
      },
    );
  }
}
