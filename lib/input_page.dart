import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'Reusable_Container.dart';
import 'Icon_Content.dart';
import 'Constants.dart';
import 'round_iconButton.dart';
import 'bottom_container.dart';
import 'calculate_BMI.dart';
import 'popUpMenuButtons.dart';

enum Gender {
  male,
  female;
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kActiveCardColor;
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  /*
  Simple If else conditions
  //Gender = 1[Male] ==2[Female]
  void updateColor(int gender) {
    if (gender == 1) {
      if (maleCardColor == inactiveCardColor) {
        maleCardColor = activeCardColor;
        femaleCardColor = inactiveCardColor;
      } else {
        maleCardColor = inactiveCardColor;
      }
    } else if (gender == 2) {
      if (femaleCardColor == inactiveCardColor) {
        femaleCardColor = activeCardColor;
        maleCardColor = inactiveCardColor;
      } else {
        femaleCardColor = inactiveCardColor;
      }
    }
  }
   */

  /*

  Simple if else but using Enums

  void updateColor(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      if (maleCardColor == inactiveCardColor) {
        maleCardColor = activeCardColor;
        femaleCardColor = inactiveCardColor;
      } else {
        maleCardColor = inactiveCardColor;
        femaleCardColor = activeCardColor;
      }
    }
    if (selectedGender == Gender.female) {
      if (femaleCardColor == inactiveCardColor) {
        femaleCardColor = activeCardColor;
        maleCardColor = inactiveCardColor;
      } else {
        femaleCardColor = inactiveCardColor;
        maleCardColor = activeCardColor;
      }
    }
  }

   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
        ),
        actions: popUpButtons,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableContainer(
                    //A function of first order is created in Reusable container containing GestureButton
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(icon: Icons.male, iconText: "MALE"),
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild:
                        IconContent(icon: Icons.female, iconText: "FEMALE"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableContainer(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "HEIGHT",
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //Ye do line cm ko 180 k niche laane k liye
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: labelNumColor),
                      const Text(
                        'cm',
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 12),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 24),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableContainer(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("WEIGHT", style: labelTextStyle),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: labelNumColor,
                            ),
                            const Text(
                              'kg',
                              style: labelTextStyle,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("AGE", style: labelTextStyle),
                        Text(
                          age.toString(),
                          style: labelNumColor,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomContainer(
            bottomText: "Calculate",
            onPress: () {
              CalculateBMI calc = CalculateBMI(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.bmiResult(),
                    bmiText: calc.BMItext(),
                    bmiDescription: calc.BMIdescription(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
