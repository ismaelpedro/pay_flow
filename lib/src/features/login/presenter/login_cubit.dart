import 'package:flutter_bloc/flutter_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
}
