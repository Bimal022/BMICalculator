import 'package:flutter/material.dart';
import 'Constants.dart';

class BottomContainer extends StatelessWidget {
  BottomContainer({required this.bottomText, required this.onPress});
  final String bottomText;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: kBottomContainerColor,
        height: kBottomContainerHeight,
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 20),
        margin: EdgeInsets.only(top: 10),
        child: Center(
          child: Text(
            bottomText,
            style: largeTextStyle,
          ),
        ),
      ),
    );
  }
}
