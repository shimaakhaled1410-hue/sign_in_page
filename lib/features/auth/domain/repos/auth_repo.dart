import 'package:sign_in_page/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<UserEntity> signIn(String email, String password);
}
