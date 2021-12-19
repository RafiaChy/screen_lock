import 'package:flutter/material.dart';

class BlankSpace extends StatelessWidget {
  final double height;
  final double width;

  BlankSpace({required this.height, required this.width});

  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 1.6,
      width: width * 1.6,
      child: Center(
        child: Text(
          '',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey[500],
          ),
        ),
      ),
    );
  }
}
