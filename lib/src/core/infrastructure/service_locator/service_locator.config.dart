// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;

import '../../../features/login/presenter/cubits/login_cubit.dart' as _i8;
import '../auth/auth_service.dart' as _i6;
import '../http/http_client.dart' as _i7;
import 'pay_flow_module.dart' as _i9;

const String _prod = 'prod';
const String _test = 'test';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final payFlowModule = _$PayFlowModule();
    gh.lazySingleton<_i3.FirebaseAuth>(
      () => payFlowModule.firebaseAuth,
      registerFor: {_prod},
    );
    gh.lazySingleton<_i3.FirebaseAuth>(
      () => payFlowModule.firebaseAuthTest,
      registerFor: {_test},
    );
    gh.lazySingleton<_i4.GoogleSignIn>(
      () => payFlowModule.googleSignIn,
      registerFor: {_prod},
    );
    gh.lazySingleton<_i4.GoogleSignIn>(
      () => payFlowModule.googleSignInTest,
      registerFor: {_test},
    );
    gh.factory<List<_i5.Interceptor>>(
      () => payFlowModule.interceptors,
      instanceName: 'Interceptors',
    );
    gh.factory<String>(
      () => payFlowModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.singleton<_i6.AuthService>(_i6.AuthService(
      gh<_i3.FirebaseAuth>(),
      gh<_i4.GoogleSignIn>(),
    ));
    gh.lazySingleton<_i7.HttpClient>(() => payFlowModule.httpAdapter(
          gh<String>(instanceName: 'BaseUrl'),
          gh<List<_i5.Interceptor>>(instanceName: 'Interceptors'),
        ));
    gh.factory<_i8.LoginCubit>(() => _i8.LoginCubit(gh<_i6.AuthService>()));
    return this;
  }
}

class _$PayFlowModule extends _i9.PayFlowModule {}
