//The widget for customising the buttons on the Menu page

import 'package:flutter/material.dart';

class CustomMenuButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String text;
  const CustomMenuButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 5.0,
      fillColor: Colors.grey[900],
      splashColor: Colors.greenAccent,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.face,
              color: Colors.purple.shade700,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}
