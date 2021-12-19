// The widget that Prompts the user to either
//1: Create PIN
//2: Re-enter PIN
//3:Enter PIN

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePinPrompt extends StatelessWidget {
  const CreatePinPrompt({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      padding: const EdgeInsets.all(
        15.0,
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(fontSize: 20),
          color: const Color(0xFF90A4Ae),
        ),
      ),
      alignment: Alignment.center,
    );
  }
}
