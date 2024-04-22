import 'package:bmi_calculator_flutter/Screens/calculator_brain.dart';
import 'result_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter/Components/layout_item.dart';
import '../Components/gender_card.dart';
import '../Components/round_icon_button.dart';
import 'package:bmi_calculator_flutter/Components//constant.dart';
import 'package:bmi_calculator_flutter/Components/bottom_button.dart';

enum Gender { male, female, other }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.other;
  int height = 180;
  int weight = 60;
  int age = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: LayoutItem(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? activeCardColour
                      : inactiveCardColour,
                  childCard: GenderCard(
                    genderIcon: Icons.male,
                    genderName: 'Male',
                    genderColor: selectedGender == Gender.male
                        ? activeTextColour
                        : inactiveTextColour,
                  ),
                )),
                Expanded(
                    child: LayoutItem(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? activeCardColour
                      : inactiveCardColour,
                  childCard: GenderCard(
                    genderIcon: Icons.female,
                    genderName: 'Female',
                    genderColor: selectedGender == Gender.female
                        ? activeTextColour
                        : inactiveTextColour,
                  ),
                ))
              ],
            ),
          ),
          Expanded(
              child: LayoutItem(
            colour: activeCardColour,
            childCard: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Height',
                  style: TextStyle(fontSize: 20, color: activeTextColour),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(),
                        style:
                            TextStyle(fontSize: 50, color: activeTextColour)),
                    Text('cm',
                        style: TextStyle(fontSize: 20, color: activeTextColour))
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      overlayColor: Color(0x29EB1555)),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: LayoutItem(
                  colour: activeCardColour,
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Weight',
                          style:
                              TextStyle(fontSize: 20, color: activeTextColour)),
                      Text(weight.toString(),
                          style:
                              TextStyle(fontSize: 50, color: activeTextColour)),
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
                          SizedBox(
                            width: 15,
                          ),
                          RoundIconButton(
                            icon: Icons.add,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: LayoutItem(
                  colour: activeCardColour,
                  childCard: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Age',
                          style:
                              TextStyle(fontSize: 20, color: activeTextColour)),
                      Text(age.toString(),
                          style:
                              TextStyle(fontSize: 50, color: activeTextColour)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: Icons.remove),
                          SizedBox(
                            width: 15,
                          ),
                          RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: Icons.add)
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(weight: weight, height: height);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            calculateBMI: calc.calculateBMI(),
                            getInterpretion: calc.getInterpretion(),
                            getResult: calc.getResult(),
                          )));
            },
            title: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
