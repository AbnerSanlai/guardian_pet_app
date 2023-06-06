import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/user_entity.dart';
import '../../../../domain/usecase/user_login_usecase.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserLoginUsecase _userLoginUsecase;

  AuthenticationBloc({
    required UserLoginUsecase authenticationGoogleUsecase,
  })  : _userLoginUsecase = authenticationGoogleUsecase,
        super(AuthenticationInitial()) {
    on<AuthenticationLoginEvent>(_authenticationLoginEvent);
  }

  Future<void> _authenticationLoginEvent(
    AuthenticationLoginEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(
      AuthenticationLoading(),
    );

    final result = await _userLoginUsecase.call(
      password: event.password,
      username: event.username,
    );

    result.fold(
      (left) {
        emit(
          AuthenticationFailure(
            message: left.message ?? '',
          ),
        );
      },
      (right) {
        emit(
          AuthenticationSuccess(
            user: right,
          ),
        );
      },
    );
  }
}
