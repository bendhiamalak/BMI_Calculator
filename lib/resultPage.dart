import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';


class ResultPage extends StatelessWidget {
  ResultPage({required this.resultText,required this.bmiResult,required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Result',
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          
          Expanded(
            flex: 5,
              child: ReusableCard(
            colour: kInactiveCardColour,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(resultText.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: resultTextStyle,),
                    Text(bmiResult,
                    textAlign: TextAlign.center,
                    style: KBMITextStyle,),
                    Text(interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyStyle,)
                  ],
                ),
          )),SizedBox(
            height: 10.0,
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              child: Center(child: Text("RE-CALCULATE", style: kLargeNumberStyle,)),
              padding: EdgeInsets.only(bottom: 20.0),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 80.0,
            ),
          ),
        ],
      ),
    );
  }
}
