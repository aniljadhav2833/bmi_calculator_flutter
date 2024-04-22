import 'package:bmi_calculator_flutter/Components/layout_item.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter/Components/bottom_button.dart';
import 'package:bmi_calculator_flutter/Components/constant.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
      required this.calculateBMI,
      required this.getResult,
      required this.getInterpretion});

  final String calculateBMI;
  final String getResult;
  final String getInterpretion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULTOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  'Your Result',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: LayoutItem(
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(getResult,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.green[600],
                          fontWeight: FontWeight.bold)),
                  Text(calculateBMI,
                      style: TextStyle(
                          fontSize: 100, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Normal BMI Range:',
                      style: TextStyle(fontSize: 15, color: activeTextColour)),
                  Text('18,5 - 25 kg/m2',
                      style: TextStyle(fontSize: 15, color: activeTextColour)),
                  SizedBox(
                    height: 20,
                  ),
                  Text(getInterpretion,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22, color: activeTextColour)),
                ],
              ),
              colour: activeCardColour,
              onPress: () {},
            ),
          ),
          BottomButton(
            onTap: () {
              Navigator.pop(context);
            },
            title: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
