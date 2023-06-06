part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  final UserEntity user;

  AuthenticationSuccess({
    required this.user,
  });

  @override
  List<Object> get props => [
        user,
      ];
}

class AuthenticationFailure extends AuthenticationState {
  final String message;

  AuthenticationFailure({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}
