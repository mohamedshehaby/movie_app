part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthLoginState extends AuthState {}

class AuthLogoutState extends AuthState {}

class AuthFailureState extends AuthState {
  final Failure failure;

  const AuthFailureState(this.failure);

  @override
  List<Object> get props => [failure];
}
