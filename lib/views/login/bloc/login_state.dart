part of 'login_bloc.dart';

enum LoginStatus { open, inProgress, error, success }

class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.open,
    this.errorMessage,
  });

  final String? errorMessage;

  final LoginStatus status;

  LoginState copyWith({
    String? errorMessage,
    LoginStatus? status,
  }) {
    return LoginState(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [errorMessage, status];
}
