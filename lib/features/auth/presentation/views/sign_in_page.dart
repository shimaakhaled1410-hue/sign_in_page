import 'package:flutter/material.dart';
import 'widgets/sign_in_bloc_consumer.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInBlocConsumer(),
    );
  }
}
