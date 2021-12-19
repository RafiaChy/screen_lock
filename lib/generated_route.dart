//1. Handles all the navigation routes and related arguments here
//2. uses BlocProvider

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafia_cake_tech/screens/authenticate_screen.dart';
import 'package:rafia_cake_tech/screens/confirm_pin_screen.dart';
import '../screens/create_pin_screen.dart';
import '../screens/menu_screen.dart';
import 'bloc/passcode_bloc.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const MenuScreen(),
        );
      case '/create-pin-screen':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => PasscodeBloc(),
            child: const CreatePinScreen(),
          ),
        );

      case '/confirm-pin-screen':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => PasscodeBloc(),
              child: ConfirmPinScreen(
                passcode: args,
              ),
            ),
          );
        }

        break;

      case '/authenticate-passcode':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => PasscodeBloc(),
              child: const AuthenticateScreen()),
        );
    }
    return _errorRoute();
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error'),
        ),
      );
    },
  );
}
