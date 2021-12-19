//The widget for the empty space on the left-hand side of zero numKey

import 'package:flutter/material.dart';

class BlankSpace extends StatelessWidget {
  final double height;
  final double width;

  const BlankSpace({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 1.6,
      width: width * 1.6,
      child: const Center(
        child: Text(
          '',
        ),
      ),
    );
  }
}
