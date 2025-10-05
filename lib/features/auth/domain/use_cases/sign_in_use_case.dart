import 'package:sign_in_page/features/auth/domain/entities/user_entity.dart';
import 'package:sign_in_page/features/auth/domain/repos/auth_repo.dart';

class SignInUseCase {
  final AuthRepo authRepo;

  SignInUseCase(this.authRepo);

  Future<UserEntity> call(String email, String password) {
    return authRepo.signIn(email, password);
  }
}
