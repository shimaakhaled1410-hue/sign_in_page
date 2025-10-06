import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_page/core/utils/styles.dart';
import 'package:sign_in_page/core/widgets/custom_button.dart';
import 'package:sign_in_page/features/auth/presentation/manager/sign_in_cubit/cubit/sign_in_cubit.dart';
import 'custom_text_field.dart';

class SignInBody extends StatelessWidget {
  SignInBody({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _onSignInPressed(BuildContext context) {
    context.read<SignInCubit>().signIn(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Center(
            child: Text(
              "Sign In",
              style: 
              Styles.textStyle28.copyWith(
                color: Colors.green[700]
                ),
            ),
          ),
          const SizedBox(height: 40),
          CustomTextField(
            controller: emailController,
            label: 'Email',
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.username],
          ),
          CustomTextField(
            controller: passwordController,
            label: 'Password',
            obscureText: true,
            icon: Icons.lock_outline,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            autofillHints: const [AutofillHints.password],
          ),
          const SizedBox(height: 32),
          CustomButton(
            text: 'Sign In',
            onPressed: () => _onSignInPressed(context),
          ),
        ],
      ),
    );
  }
}
