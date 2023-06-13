import 'package:flutter/material.dart';

/* Use flutter extract from
 refractor to create a custom class widget*/
class ReusableContainer extends StatelessWidget {
  ReusableContainer({required this.colour, this.cardChild, this.onPress});
  final Color colour;
  final Widget? cardChild;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
