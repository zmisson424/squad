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
    on<CreateAccountWithEmail>(_createAccountWithEmail);
    on<ForgotPassword>(_sendPasswordResetEmail);
    on<GoogleLoginAttempt>(_loginWithGoogle);
    on<AppleLoginAttempt>(_loginWithApple);
    on<FacebookLoginAttempt>(_loginWithFacebook);
    on<TwitterLoginAttempt>(_loginWithTwitter);
    on<GithubLoginAttempt>(_loginWithGithub);
    on<MicrosoftLoginAttempt>(_loginWithMicrosoft);
  }

  final AuthRepository _authRepository;

  void _loginFailure(
    LoginFailure event,
    Emitter<LoginState> emit,
  ) async {
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

  void _createAccountWithEmail(
    CreateAccountWithEmail event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(state.copyWith(status: LoginStatus.inProgress));
      await _authRepository.createAccountWithEmail(
        email: event.email,
        password: event.password,
        name: event.name,
      );
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      add(LoginFailure(errorMessage: e.message));
    }
  }

  void _sendPasswordResetEmail(
    ForgotPassword event,
    Emitter<LoginState> emit,
  ) async {
    try {
      await _authRepository.requestPasswordReset(email: event.email);
    } on ResetPasswordResetFailure catch (e) {
      add(LoginFailure(errorMessage: e.message));
    }
  }

  void _loginWithGoogle(
    GoogleLoginAttempt event,
    Emitter<LoginState> emit,
  ) async {
    try {
      await _authRepository.loginWithGoogle();
    } on LogInWithGoogleFailure catch (e) {
      add(LoginFailure(errorMessage: e.message));
    }
  }

  void _loginWithApple(
    AppleLoginAttempt event,
    Emitter<LoginState> emit,
  ) async {
    try {
      await _authRepository.loginWithApple();
    } on LogInWithAppleFailure catch (e) {
      add(LoginFailure(errorMessage: e.message));
    }
  }

  void _loginWithFacebook(
    FacebookLoginAttempt event,
    Emitter<LoginState> emit,
  ) async {
    try {
      await _authRepository.loginWithFacebook();
    } on LogInWithFacebookFailure catch (e) {
      add(LoginFailure(errorMessage: e.message));
    }
  }

  void _loginWithTwitter(
    TwitterLoginAttempt event,
    Emitter<LoginState> emit,
  ) async {
    try {
      await _authRepository.loginWithTwitter();
    } on LogInWithTwitterFailure catch (e) {
      add(LoginFailure(errorMessage: e.message));
    }
  }

  void _loginWithGithub(
    GithubLoginAttempt event,
    Emitter<LoginState> emit,
  ) async {
    try {
      await _authRepository.loginWithGithub();
    } on LogInWithGithubFailure catch (e) {
      add(LoginFailure(errorMessage: e.message));
    }
  }

  void _loginWithMicrosoft(
    MicrosoftLoginAttempt event,
    Emitter<LoginState> emit,
  ) async {
    try {
      await _authRepository.loginWithMicrosoft();
    } on LogInWithMicrosoftFailure catch (e) {
      add(LoginFailure(errorMessage: e.message));
    }
  }
}
