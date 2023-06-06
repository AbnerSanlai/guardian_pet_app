import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/usecase/user_register_usecase.dart';
import '../../../../infra/models/user_model.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRegisterUsecase _userRegisterUsecase;

  RegisterBloc({
    required UserRegisterUsecase userRegisterUsecase,
  })  : _userRegisterUsecase = userRegisterUsecase,
        super(RegisterInitial()) {
    on<RegisterUserEvent>(_registerUserEvent);
  }

  Future<void> _registerUserEvent(
    RegisterUserEvent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(
      RegisterLoading(),
    );

    final result = await _userRegisterUsecase.call(
      userModel: event.userModel,
    );

    result.fold(
      (left) {
        emit(
          RegisterFailure(
            message: left.message ?? '',
          ),
        );
      },
      (right) {
        emit(
          RegisterSuccess(),
        );
      },
    );
  }
}
