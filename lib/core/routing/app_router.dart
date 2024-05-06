import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/features/login/ui/login_screen.dart';
import 'package:medical_app/features/on_boarding_screen/onboarding_screen.dart';

import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.signUpScreen:
        // return MaterialPageRoute(
        //   builder: (_) => BlocProvider(
        //     create: (context) => getIt<SignupCubit>(),
        //     child: const SignupScreen(),
         // ),
      //  );
      case Routes.homeScreen:
        // return MaterialPageRoute(
        //   builder: (_) => const HomeScreen(),
        // );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
