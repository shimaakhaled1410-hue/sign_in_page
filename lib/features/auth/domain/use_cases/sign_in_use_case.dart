import 'package:dartz/dartz.dart';
import 'package:sign_in_page/features/auth/domain/entities/user_entity.dart';
import 'package:sign_in_page/features/auth/domain/repos/auth_repo.dart';

import '../../../../core/errors/failure.dart';

class SignInUseCase {
  final AuthRepo authRepo;

  SignInUseCase(this.authRepo);

  Future<Either<Failure,UserEntity>> call(String email, String password)async {
    return await authRepo.signIn(email, password);
  }
}
