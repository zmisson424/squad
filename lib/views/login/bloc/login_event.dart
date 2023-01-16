part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginFailure extends LoginEvent {
  final String errorMessage;

  const LoginFailure({required this.errorMessage});
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

class CreateAccountWithEmail extends LoginEvent {
  final String email;
  final String password;
  final String name;

  const CreateAccountWithEmail({
    required this.email,
    required this.password,
    required this.name,
  });

  @override
  List<Object> get props => [email, password, name];
}

class ForgotPassword extends LoginEvent {
  final String email;

  const ForgotPassword({required this.email});

  @override
  List<Object> get props => [email];
}

class GoogleLoginAttempt extends LoginEvent {}
