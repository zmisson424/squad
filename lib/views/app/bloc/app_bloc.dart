import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:squad/api/repositories/auth_repository.dart';
import 'package:squad/models/user.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(authRepository.currentUser.isEmpty
            ? const AppState.unauthenticated()
            : AppState.authenticated(
                authRepository.currentUser,
              )) {
    on<AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);

    _authSubscription =
        _authRepository.user.listen((user) => add(AppUserChanged(user)));
  }

  final AuthRepository _authRepository;

  late final StreamSubscription<User> _authSubscription;

  void _onUserChanged(AppUserChanged event, Emitter<AppState> emit) {
    emit(event.user.isEmpty
        ? const AppState.unauthenticated()
        : AppState.authenticated(event.user));
  }

  void _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) {
    unawaited(_authRepository.logout());
  }

  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }
}
