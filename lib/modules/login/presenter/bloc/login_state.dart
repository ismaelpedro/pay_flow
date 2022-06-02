part of 'login_bloc.dart';

abstract class LoginState {}

class InitialLoginState extends LoginState {}

class LoadingLoginState extends LoginState {}

class ErrorLoginState extends LoginState {}

class SuccessLoginState extends LoginState {
  final UserEntity user;
  SuccessLoginState(this.user);
}
