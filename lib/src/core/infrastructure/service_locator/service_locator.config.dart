// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pay_flow/src/core/data/datasources/ticket_datasource/i_ticket_datasource.dart'
    as _i9;
import 'package:pay_flow/src/core/data/datasources/user_datasource/i_user_datasource.dart'
    as _i11;
import 'package:pay_flow/src/core/data/repositories/ticket_repository.dart'
    as _i8;
import 'package:pay_flow/src/core/data/repositories/user_repository.dart'
    as _i10;
import 'package:pay_flow/src/core/domain/services/auth_service.dart' as _i4;
import 'package:pay_flow/src/core/infrastructure/auth/auth_service.dart' as _i3;
import 'package:pay_flow/src/core/infrastructure/http/adapters/dio_http_adapter.dart'
    as _i5;
import 'package:pay_flow/src/features/login/presenter/cubits/login_cubit.dart'
    as _i7;

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
    gh.factory<_i3.AuthService>(() => _i3.AuthService());
    gh.factory<_i4.AuthService>(() => _i4.AuthService());
    gh.factory<_i5.DioHttpAdapter>(() => _i5.DioHttpAdapter(
          baseUrl: gh<String>(),
          interceptors: gh<List<_i6.Interceptor>>(),
        ));
    gh.factory<_i7.LoginCubit>(() => _i7.LoginCubit(gh<_i3.AuthService>()));
    gh.factory<_i8.TicketRepository>(
        () => _i8.TicketRepository(gh<_i9.ITicketDatasource>()));
    gh.factory<_i10.UserRepository>(
        () => _i10.UserRepository(gh<_i11.IUserDatasource>()));
    return this;
  }
}
