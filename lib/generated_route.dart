import 'package:flutter/material.dart';
import '../screens/create_pin_screen.dart';
import '../screens/menu_screen.dart';

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
          builder: (_) => CreatePinScreen(),
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
