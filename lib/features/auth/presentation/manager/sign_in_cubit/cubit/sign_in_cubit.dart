import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sign_in_page/features/auth/domain/entities/user_entity.dart';

import '../../../../domain/use_cases/sign_in_use_case.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInUseCase signInUseCase;

  SignInCubit(this.signInUseCase) : super(SignInInitial());

  Future<void> signIn(String email, String password) async {
    emit(SignInLoading());

    var result = await signInUseCase(email, password);
    result.fold(
      (failure) {
        emit(SignInFailure(failure.message));
      },
      (user) {
        emit(SignInSuccess(user));
      },
    );
  }
}
