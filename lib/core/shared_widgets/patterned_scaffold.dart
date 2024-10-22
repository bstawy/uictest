import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_config_cubit/app_config_cubit.dart';
import '../utils/assets_manager.dart';

class PatternedScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? bottomNavigationBar;

  const PatternedScaffold({
    super.key,
    this.appBar,
    this.body,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeigh = MediaQuery.sizeOf(context).height;
    final screenWitdth = MediaQuery.sizeOf(context).width;

    return BlocBuilder<AppConfigCubit, AppConfigState>(
      buildWhen: (previous, current) => current is ChangeTheme,
      builder: (context, state) {
        final String pattern = context.read<AppConfigCubit>().themeIsDark
            ? AssetsManager.backgroundPatternDarkImage
            : AssetsManager.backgroundPatternImage;
        return Container(
          width: screenWitdth,
          height: screenHeigh,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(pattern),
              fit: BoxFit.fitWidth,
            ),
          ),
          // child: Directionality(
          //   textDirection: GetConfigs.isArabicLanguage(context)
          //       ? TextDirection.rtl
          //       : TextDirection.ltr,
          child: Scaffold(
            appBar: appBar,
            body: body,
            bottomNavigationBar: bottomNavigationBar,
          ),
          // ),
        );
      },
    );
  }
}
