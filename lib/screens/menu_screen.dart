//Menu page that either navigates to Create PIN Page or Authenticate Page

import 'package:flutter/material.dart';
import '../components/custom_menu_button.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
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
                onPressed: () {
                  Navigator.of(context).pushNamed('/authenticate-passcode');
                },
                text: 'Authenticate',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/**
 * flutter build apk --build-name=1.0.3 --build-number=3
 */