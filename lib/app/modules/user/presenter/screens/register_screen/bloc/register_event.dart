part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterUserEvent extends RegisterEvent {
  final UserModel userModel;

  const RegisterUserEvent({
    required this.userModel,
  });

  @override
  List<Object> get props => [
        userModel,
      ];
}
