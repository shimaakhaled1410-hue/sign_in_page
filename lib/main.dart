import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_page/core/utils/app_router.dart';
import 'package:sign_in_page/features/auth/data/repos/auth_repo_impl.dart';
import 'package:sign_in_page/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:sign_in_page/features/auth/presentation/manager/sign_in_cubit/cubit/sign_in_cubit.dart';
import 'core/utils/functions/servic_locator.dart';

void main() {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return SignInCubit(SignInUseCase(getIt.get<AuthRepoImpl>()));
          },
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: ThemeData.light(),
      ),
    );
  }
}
