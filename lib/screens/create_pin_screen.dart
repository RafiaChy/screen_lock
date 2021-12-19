import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:rafia_cake_tech/bloc/passcode_bloc.dart';
import 'package:rafia_cake_tech/models/user.dart';
import 'package:rafia_cake_tech/screens/confirm_pin_screen.dart';
import '../components/hold_pin.dart';
import '../components/blank_space.dart';

import '../components/create_pin_prompt.dart';

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({Key? key}) : super(key: key);

  @override
  _CreatePinScreenState createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  var pin = '';
  var selectedindex = 0;
  var text = 'Create PIN';

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
              top: 14,
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
      body: BlocConsumer<PasscodeBloc, PasscodeState>(
        listener: (context, state) {
          if (state.status == PasscodeStatus.passcodeScreenDone) {
            Navigator.of(context)
                .pushNamed('/confirm-pin-screen', arguments: pin);
          }
        },
        builder: (context, state) {
          return Container(
            color: Colors.white70,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CreatePinPrompt(
                  text: text,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HoldCode(
                      height: height,
                      width: width,
                      index: 1,
                      selectedIndex: selectedindex,
                      pincode: pin,
                    ),
                    HoldCode(
                      height: height,
                      width: width,
                      index: 2,
                      selectedIndex: selectedindex,
                      pincode: pin,
                    ),
                    HoldCode(
                      height: height,
                      width: width,
                      index: 3,
                      selectedIndex: selectedindex,
                      pincode: pin,
                    ),
                    HoldCode(
                      height: height,
                      width: width,
                      index: 4,
                      selectedIndex: selectedindex,
                      pincode: pin,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          numericKey(
                            height,
                            width,
                            1,
                          ),
                          numericKey(
                            height,
                            width,
                            2,
                          ),
                          numericKey(
                            height,
                            width,
                            3,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          numericKey(
                            height,
                            width,
                            4,
                          ),
                          numericKey(
                            height,
                            width,
                            5,
                          ),
                          numericKey(
                            height,
                            width,
                            6,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          numericKey(
                            height,
                            width,
                            7,
                          ),
                          numericKey(
                            height,
                            width,
                            8,
                          ),
                          numericKey(
                            height,
                            width,
                            9,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlankSpace(height: height, width: width),
                          numericKey(
                            height,
                            width,
                            0,
                          ),
                          backSpace(height, width),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

//**************************************METHODS**************************************************//
  TextButton numericKey(double height, double width, int numKey) {
    return TextButton(
      onPressed: () {
        addNumKey(numKey);
      },
      child: Container(
        height: height * 1.2,
        width: width * 1.2,
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
            '$numKey',
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

  TextButton backSpace(
    double height,
    double width,
  ) {
    return TextButton(
      onPressed: backspace,
      child: Container(
        height: height * 1.2,
        width: width * 1.2,
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
            child: Icon(
          Icons.backspace,
          color: Colors.grey[500],
          size: 18.0,
        )),
      ),
    );
  }

  void addNumKey(int numKey) {
    if (pin.length < 4) {
      setState(() {
        pin = pin + numKey.toString();
        selectedindex = pin.length;
      });
    }
    //navigate to error screen----test
    if (pin.length == 4) {
      context.read<PasscodeBloc>().passcodeScreenValidation(pin);
      final newPin = User(pin);
      //Adding to Hive
      Hive.box('users').add(newPin);
    }
  }

  backspace() {
    if (pin.isEmpty) {
      return;
    }
    setState(() {
      pin = pin.substring(0, pin.length - 1);
      selectedindex = pin.length;
    });
  }
}
