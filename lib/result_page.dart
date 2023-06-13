import 'package:bmi_calculator/Reusable_Container.dart';
import 'package:flutter/material.dart';
import 'Constants.dart';
import 'bottom_container.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
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
                      "OverWeight",
                      style: resultTextStyle,
                    ),
                  ),
                  Container(
                    child: Text(
                      "20.0",
                      style: bmiTextStyle,
                    ),
                  ),
                  Container(
                    child: Text(
                      "Description",
                      style: descriptionTextStyle,
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
