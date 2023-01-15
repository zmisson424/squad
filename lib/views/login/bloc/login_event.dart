part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class EmailLoginAttempt extends LoginEvent {
  final String email;
  final String password;

  const EmailLoginAttempt({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class LoginFailure extends LoginEvent {
  final String errorMessage;

  const LoginFailure({required this.errorMessage});
}
