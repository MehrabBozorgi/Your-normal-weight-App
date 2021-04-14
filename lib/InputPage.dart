import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/CalculatorBrain.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Constans.dart';
import 'IconContent.dart';
import 'ResultPage.dart';
import 'ReusableCard.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('وزن سلامت'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      colour: selectedGender == Gender.male
                          ? KActiveCardColour
                          : KInActiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'مرد',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      colour: selectedGender == Gender.female
                          ? KActiveCardColour
                          : KInActiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'زن',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                children: [
                  Text(
                    'قد',
                    style: KLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        height.toString(),
                        style: KNumberTextStyle,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('cm'),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                    activeColor: KBottomContainerColor,
                    inactiveColor: KFontColor,
                    min: 120.0,
                    max: 220.0,
                  )
                ],
              ),
              colour: KActiveCardColour,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'وزن',
                          style: KLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: KNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 30,
                              ),
                              backgroundColor: KFontColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(Icons.add,
                                  color: Colors.white, size: 30),
                              backgroundColor: KFontColor,
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: KActiveCardColour,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'سن',
                          style: KLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: KNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 30,
                              ),
                              backgroundColor: KFontColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(Icons.add,
                                  color: Colors.white, size: 30),
                              backgroundColor: KFontColor,
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: KActiveCardColour,
                  ),
                ),
              ],
            ),
          ),
          /////  Button  //////
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.getCalculateBMI(),
                    resultText: calc.getResult(),
                    desc: calc.getDesc(),
                  ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(top: 10),
              color: KBottomContainerColor,
              width: double.infinity,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'دیدن نتیجه',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
