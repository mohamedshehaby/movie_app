import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/network/failure.dart';

import '../../../domain/entities/params.dart';
import '../../../domain/usecases/login_user_usecase.dart';
import '../../../domain/usecases/logout_user_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  LoginUserUseCase loginUserUseCase;
  LogoutUserUseCase logoutUserUseCase;

  AuthBloc({required this.loginUserUseCase, required this.logoutUserUseCase})
      : super(AuthInitial()) {
    on<AuthLoginEvent>(_onLogin);
    on<AuthGuestLoginEvent>(_onGuestLogin);
    on<AuthLogoutEvent>(_onLogout);
  }

  _onLogin(AuthLoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    (await loginUserUseCase(LoginRequestParams(username: event.username, password: event.password)))
        .fold(
      (failure) => emit(AuthFailureState(failure)),
      (_) => emit(AuthLoginState()),
    );
  }

  _onGuestLogin(AuthGuestLoginEvent event, Emitter<AuthState> emit) {
    emit(AuthLoadingState());
    emit(AuthLoginState());
  }

  _onLogout(AuthLogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    (await logoutUserUseCase(NoParams())).fold(
      (failure) => emit(AuthFailureState(failure)),
      (_) => emit(AuthLogoutState()),
    );
  }
}
