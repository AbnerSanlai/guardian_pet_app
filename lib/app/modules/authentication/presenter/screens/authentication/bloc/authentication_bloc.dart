import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/user_entity.dart';
import '../../../../domain/usecase/authentication_google_usecase.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationGoogleUsecase _authenticationGoogleUsecase;

  AuthenticationBloc({
    required AuthenticationGoogleUsecase authenticationGoogleUsecase,
  })  : _authenticationGoogleUsecase = authenticationGoogleUsecase,
        super(AuthenticationInitial()) {
    on<AuthenticationGoogleEvent>(_authenticationGoogleEvent);
  }

  Future<void> _authenticationGoogleEvent(
    AuthenticationGoogleEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(
      AuthenticationLoading(),
    );

    final result = await _authenticationGoogleUsecase.call();

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
