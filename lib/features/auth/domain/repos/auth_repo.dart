import 'package:dartz/dartz.dart';
import 'package:sign_in_page/features/auth/domain/entities/user_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure,UserEntity>> signIn(String email, String password);
}
