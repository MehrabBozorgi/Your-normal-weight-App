import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/Constans.dart';
import 'package:flutter_bmi_calculator/ReusableCard.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String desc;

  ResultPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.desc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('وزن سلامت'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'نتیجه شما',
                style: KTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: KInActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiResult,
                    style: KResultTextStyle,
                  ),
                  Text(
                    resultText,
                    style: KBMITextStyle,
                  ),
                  Text(
                    desc,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(top: 10),
              color: KBottomContainerColor,
              width: double.infinity,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'محاسبه دوباره',
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
