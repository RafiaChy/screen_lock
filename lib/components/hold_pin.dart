import 'package:flutter/material.dart';

class HoldCode extends StatelessWidget {
  const HoldCode({
    Key? key,
    required this.height,
    required this.width,
    required this.selectedIndex,
    required this.index,
    required this.pincode,
  }) : super(key: key);

  final double height;
  final double width;
  final int selectedIndex;
  final int index;
  final String pincode;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Container(
        height: height * 0.5,
        width: width * 0.5,
        decoration: BoxDecoration(
          color: index == selectedIndex ? Colors.purple.shade600 : Colors.grey,
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
        child: pincode.length + 1 > index
            ? Container(
                height: height * 0.5,
                width: width * 0.5,
                decoration: BoxDecoration(
                  color: Colors.purple.shade600,
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white54,
                      offset: Offset(0, 0),
                      spreadRadius: 1.5,
                      blurRadius: 2,
                    ),
                  ],
                ),
              )
            : Container(
                height: height * 0.5,
                width: width * 0.5,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white54,
                      offset: Offset(0, 0),
                      spreadRadius: 1.5,
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
