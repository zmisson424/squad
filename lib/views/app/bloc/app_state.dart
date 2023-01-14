part of 'app_bloc.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
}

class AppState extends Equatable {
  const AppState._({
    required this.status,
  });

  final AuthStatus status;

  @override
  List<Object> get props => [status];
}
