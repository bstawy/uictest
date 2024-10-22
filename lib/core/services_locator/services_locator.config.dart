// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/data_sources/remote_auth_data_source.dart'
    as _i774;
import '../../features/auth/data/repos/auth_repo.dart' as _i507;
import '../../features/auth/presentation/login/cubit/login_cubit.dart' as _i179;
import '../../features/auth/presentation/sign_up/cubit/sign_up_cubit.dart'
    as _i302;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i774.AuthRemoteDataSource>(() => _i774.AuthRemoteDataSource());
    gh.factory<_i507.AuthRepo>(
        () => _i507.AuthRepo(gh<_i774.AuthRemoteDataSource>()));
    gh.factory<_i179.LoginCubit>(() => _i179.LoginCubit(gh<_i507.AuthRepo>()));
    gh.factory<_i302.SignUpCubit>(
        () => _i302.SignUpCubit(gh<_i507.AuthRepo>()));
    return this;
  }
}
