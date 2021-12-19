import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
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
          builder: (_) => MenuScreen(),
        );
      case '/create-pin-screen':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => PasscodeBloc(),

            //Hive opened with FutureBuilder. B
            child: FutureBuilder(
              future: Hive.openBox('users'),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    return const CreatePinScreen();
                  }
                } else {
                  return const Scaffold();
                }
              },
            ),
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
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => PasscodeBloc(),
                child: AuthenticateScreen(
                  passcodeDb: args,
                )),
          );
        }
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
