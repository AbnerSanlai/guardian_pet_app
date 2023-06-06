import '../../../../core/types/either.dart';
import '../entities/user_entity.dart';
import '../failure/user_failure.dart';

typedef UserLoginUsecaseCallback = Future<Either<UserLoginFailure, UserEntity>>;
typedef UserRegisterUsecaseCallback = Future<Either<UserRegisterFailure, bool>>;
