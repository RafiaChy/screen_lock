import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafia_cake_tech/bloc/passcode_bloc.dart';
import '../components/custom_menu_button.dart';

class MenuScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create or Authenticate",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
        titleTextStyle: Theme.of(context).textTheme.headline6,
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: 20, left: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomMenuButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/create-pin-screen');
                },
                text: 'Create Pin',
              ),
              const Spacer(),
              CustomMenuButton(
                onPressed: () {},
                text: 'Authenticate',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
