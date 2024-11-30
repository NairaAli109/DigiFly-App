import 'package:digifly_task/core/shared_pref/shared_pref.dart';
import 'package:digifly_task/features/auth/login/login_view.dart';
import 'package:digifly_task/features/auth/sign_up/sign_up_view.dart';
import 'package:digifly_task/features/home/bottom_nav_bar.dart';
import 'package:digifly_task/features/profile/profile_view.dart';
import 'package:digifly_task/features/setting/setting_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {

  static String get initialRoute{
    if(SharedPref().initialPageRoute()){
      return BottomNavBar.id;
    }
    else{
      return LoginView.id;
    }
  }

  static GoRouter goRouter = GoRouter(
    initialLocation: initialRoute,
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
        builder: (context, state) {
          final int? index = state.extra as int?;
          return BottomNavBar(
              navigatedIndex: index); // please add your static id route
        },
      ),
      GoRoute(
        path: ProfileView.id,
        name: ProfileView.id,
        builder: (context, state) => const ProfileView(),
      ), GoRoute(
        path: SettingView.id,
        name: SettingView.id,
        builder: (context, state) => const SettingView(),
      ),
    ],
  );
}
