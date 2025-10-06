import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_page/features/auth/presentation/manager/sign_in_cubit/cubit/sign_in_cubit.dart';
import 'sign_in_body.dart';

class SignInBlocConsumer extends StatelessWidget {
  const SignInBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Welcome ${state.userEntity.userEmail}!'),
              backgroundColor: Colors.green[600],
            ),
          );
        } else if (state is SignInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red[600],
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is SignInLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: EdgeInsets.all(16),
          child: SignInBody(),
        );
      },
    );
  }
}
