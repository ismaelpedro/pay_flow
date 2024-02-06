import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';
import 'package:injectable/injectable.dart';

import '../http/adapters/adapters.dart';
import '../http/http_client.dart';

@module
abstract class PayFlowModule {
  @Named('BaseUrl')
  String get baseUrl => 'http://localhost:8080';

  @Named('Interceptors')
  List<Interceptor> get interceptors => <Interceptor>[];

  @LazySingleton(as: HttpClient)
  DioHttpAdapter httpAdapter(
    @Named('BaseUrl') String url,
    @Named('Interceptors') List<Interceptor>? interceptors,
  ) =>
      DioHttpAdapter(
        baseUrl: url,
        interceptors: interceptors,
      );

  @lazySingleton
  @prod
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @lazySingleton
  @test
  FirebaseAuth get firebaseAuthTest => MockFirebaseAuth();

  @lazySingleton
  @prod
  GoogleSignIn get googleSignIn => GoogleSignIn();

  @lazySingleton
  @test
  GoogleSignIn get googleSignInTest => MockGoogleSignIn();
}
