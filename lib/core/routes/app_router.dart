import 'package:digifly_task/features/auth/login/login_view.dart';
import 'package:digifly_task/features/auth/sign_up/sign_up_view.dart';
import 'package:digifly_task/features/home/bottom_nav_bar.dart';
import 'package:digifly_task/features/profile/profile_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static GoRouter goRouter = GoRouter(
    initialLocation: LoginView.id,
    routes: [
      GoRoute(
        path: LoginView.id,
        name: LoginView.id,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: SignUpView.id,
        name: SignUpView.id,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: BottomNavBar.id,
        name: BottomNavBar.id,
        builder: (context, state) => const BottomNavBar(),
      ),
      GoRoute(
        path: ProfileView.id,
        name: ProfileView.id,
        builder: (context, state) => const ProfileView(),
      ),
    ],
  );
}
