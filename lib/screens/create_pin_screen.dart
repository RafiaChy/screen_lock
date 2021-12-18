import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/create_pin_prompt.dart';

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({Key? key}) : super(key: key);

  @override
  _CreatePinScreenState createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.1;
    var width = MediaQuery.of(context).size.width * 0.1;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: Colors.grey[700],
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Setup Pin',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            padding: const EdgeInsets.only(
              right: 20.0,
              top: 15,
            ),
            margin: const EdgeInsets.only(
              left: 15,
            ),
            child: Text(
              'Use 4-digits PIN',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(fontSize: 18.0),
                  color: Colors.grey[400]),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
        titleTextStyle: Theme.of(context).textTheme.headline6,
      ),
      body: Container(
        color: Colors.white70,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const CreatePinPrompt(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HoldCode(height: height, width: width),
                HoldCode(height: height, width: width),
                HoldCode(height: height, width: width),
                HoldCode(height: height, width: width),
              ],
            ),
            Column(children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NumericKey(number: 1, height: height, width: width),
                    NumericKey(number: 2, height: height, width: width),
                    NumericKey(number: 3, height: height, width: width),
                  ],
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class NumericKey extends StatelessWidget {
  const NumericKey({
    Key? key,
    required this.height,
    required this.width,
    required this.number,
  }) : super(key: key);

  final double height;
  final double width;
  final int number;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: height * 1.6,
        width: width * 1.6,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              offset: const Offset(0, 0),
              spreadRadius: 0.5,
              blurRadius: 2,
            ),
          ],
        ),
        child: Center(
          child: Text(
            '$number',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[500],
            ),
          ),
        ),
      ),
    );
  }
}

class HoldCode extends StatelessWidget {
  const HoldCode({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Container(
        height: height * 0.5,
        width: width * 0.5,
        decoration: BoxDecoration(
          color: Colors.purple.shade600,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.purple.shade700,
              offset: const Offset(0, 0),
              spreadRadius: 1.5,
              blurRadius: 2,
            ),
          ],
        ),
      ),
    );
  }
}
