import 'package:bloc/bloc.dart';
import 'package:pay_flow/core/domain/entities/user_entity.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitialLoginState()) {
    on<TryLoginEvent>((event, emit) {
      emit(SuccessLoginState(UserEntity(email: '', id: '', name: '')));
    });
  }
}
