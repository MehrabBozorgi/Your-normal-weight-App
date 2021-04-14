import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/Constans.dart';
import 'package:flutter_bmi_calculator/ReusableCard.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
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
              child: Text(
            'نتیجه شما',
            style: KTitleTextStyle,
          ),),
          Expanded(child: ReusableCard(colour: KInActiveCardColor,cardChild:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
          crossAxisAlignment: CrossAxisAlignment.center
          ,
            children: [
              Text('معمولی',style: KResultTextStyle,),
              Text('18.3'),
            ],
          )  ,))
        ],
      ),
    );
  }
}
