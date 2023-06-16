import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/user_entity.dart';
import '../../../../domain/usecase/user_login_usecase.dart';

part 'user_login_event.dart';
part 'user_login_state.dart';

class UserLoginBloc extends Bloc<UserLoginEvent, UserLoginState> {
  final UserLoginUsecase _userLoginUsecase;

  UserLoginBloc({
    required UserLoginUsecase userLoginUsecase,
  })  : _userLoginUsecase = userLoginUsecase,
        super(UserLoginInitial()) {
    on<AuthenticationLoginEvent>(_authenticationLoginEvent);
  }

  Future<void> _authenticationLoginEvent(
    AuthenticationLoginEvent event,
    Emitter<UserLoginState> emit,
  ) async {
    emit(
      UserLoginLoading(),
    );

    final result = await _userLoginUsecase.call(
      password: event.password,
      username: event.username,
    );

    result.fold(
      (left) {
        emit(
          UserLoginFailure(
            message: left.message ?? '',
          ),
        );
      },
      (right) {
        emit(
          UserLoginSuccess(
            user: right,
          ),
        );
      },
    );
  }
}
