import 'package:go_router/go_router.dart';
import 'package:sign_in_page/features/auth/presentation/views/sign_in_page.dart';

abstract class AppRouter {
  // static const kSignInView = '/signin';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SignInPage(),
      ),
    ],
  );
}
