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
            textStyle: Theme.of(context).textTheme.headline4,
            color: Colors.grey[500]),
      ),
      alignment: Alignment.center,
    );
  }
}
