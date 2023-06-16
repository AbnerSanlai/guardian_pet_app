part of 'user_login_bloc.dart';

abstract class UserLoginEvent extends Equatable {
  const UserLoginEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationLoginEvent extends UserLoginEvent {
  final String username;
  final String password;

  const AuthenticationLoginEvent({
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [
        username,
        password,
      ];
}
