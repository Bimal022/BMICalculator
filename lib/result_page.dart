import 'package:bmi_calculator/Reusable_Container.dart';
import 'package:flutter/material.dart';
import 'Constants.dart';
import 'bottom_container.dart';
import 'popUpMenuButtons.dart';

class ResultPage extends StatefulWidget {
  const ResultPage(
      {super.key,
      required this.bmiResult,
      required this.bmiText,
      required this.bmiDescription});
  final String bmiResult;
  final String bmiText;
  final String bmiDescription;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
        actions: popUpButtons,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: const Text(
              "Your Result",
              style: titleTextStyle,
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableContainer(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Text(
                      widget.bmiText,
                      style: resultTextStyle,
                    ),
                  ),
                  Container(
                    child: Text(
                      widget.bmiResult,
                      style: bmiTextStyle,
                    ),
                  ),
                  Container(
                    child: Text(
                      widget.bmiDescription,
                      style: descriptionTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomContainer(
            bottomText: "Re-Calculate",
            onPress: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
