part of 'user_login_bloc.dart';

abstract class UserLoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserLoginInitial extends UserLoginState {}

class UserLoginLoading extends UserLoginState {}

class UserLoginSuccess extends UserLoginState {
  final UserEntity user;

  UserLoginSuccess({
    required this.user,
  });

  @override
  List<Object> get props => [
        user,
      ];
}

class UserLoginFailure extends UserLoginState {
  final String message;

  UserLoginFailure({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}
