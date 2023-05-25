import '../../../../core/types/either.dart';
import '../entities/user_entity.dart';
import '../failure/authentication_failure.dart';

typedef AuthenticationGoogleUsecaseCallback
    = Future<Either<AuthenticationGoogleFailure, UserEntity>>;
