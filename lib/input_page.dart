import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'card_content.dart';
import 'constants.dart';
import 'resultPage.dart';
import 'calculatorBrain.dart';

enum Gender {
  male,
  female,
  other,
}

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.other;
  int height = 180;
  int weight=60;
  int age=20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: CardContent(
                      iconModel: FontAwesomeIcons.mars,
                      textContent: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: CardContent(
                      iconModel: FontAwesomeIcons.venus,
                      textContent: 'FEMALE',
                    ),
                  ),
                ),
                // Add other Expanded widgets for different card content...
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            colour: kInactiveCardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "HEIGHT",
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(), style: kNumberTextStyle),
                    Text(
                      "cm",
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
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
                  child: ReusableCard(
                colour: kInactiveCardColour,
                    cardChild:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "WEIGHT",
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.add,
                          onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                         SizedBox(
                           width: 10.0,
                         ) ,
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              weight--;
                            });
                          },
                        ),

                      ],
                    )
                  ],),
              )),
              Expanded(
                  child: ReusableCard(
                colour: kInactiveCardColour,
                    cardChild:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      Text(
                      "AGE",
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumberTextStyle,
                    ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.add,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ) ,
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),

                          ],
                        )

                      ])


              ))
            ],
          )),
          GestureDetector(
            onTap: (){
              CalculatorBrain calc=CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=> ResultPage(
                    resultText:calc.getResult(),
                    bmiResult:calc.calculateBMI(),
                    interpretation:calc.getInterpretation()))
              );
            },
            child: Container(
              child: Center(child: Text("CALCULATE", style: kLargeNumberStyle,)),
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

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon,required this.onPressed});
  final IconData? icon;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
        elevation: 6.0,
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0
        ),
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
        onPressed: onPressed);
  }
}
