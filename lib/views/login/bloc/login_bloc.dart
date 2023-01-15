import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squad/api/repositories/auth_repository.dart';

part 'login_state.dart';
part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const LoginState()) {
    on<LoginFailure>(_loginFailure);
    on<EmailLoginAttempt>(_emailLoginAttempt);
  }

  final AuthRepository _authRepository;

  void _loginFailure(
    LoginFailure event,
    Emitter<LoginState> emit,
  ) async {
    print("Login Failure");
    print(event.errorMessage);
    emit(state.copyWith(
      status: LoginStatus.error,
      errorMessage: event.errorMessage,
    ));
  }

  void _emailLoginAttempt(
    EmailLoginAttempt event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(state.copyWith(status: LoginStatus.inProgress));
      await _authRepository.logInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
    } on LogInWithEmailAndPasswordFailure catch (e) {
      add(LoginFailure(errorMessage: e.message));
    }
  }
}
