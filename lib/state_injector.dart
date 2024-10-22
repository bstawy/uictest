import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_config_cubit/app_config_cubit.dart';
import 'features/auth/presentation/login/cubit/Biometric/biometric_cubit.dart';

class StateInjector {
  static final blocProviders = <BlocProvider>[
    BlocProvider<AppConfigCubit>(
      create: (context) => AppConfigCubit()..getCachedConfiguration(),
    ),
    BlocProvider<BiometricCubit>(create: (context) => BiometricCubit()),
  ];
}
