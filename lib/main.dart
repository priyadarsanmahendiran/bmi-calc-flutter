import 'package:bmi_calculator/resultspage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './card.dart';
import './gender.dart';
import './roundiconbutton.dart';
import './resultspage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.red,
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          // ignore: deprecated_member_use
          body1: TextStyle(color: Colors.white),
        ),
      ),
      home: InputPage(),
    );
  }
}

const activCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Colors.black;
bool activatedMale = false;
bool activatedFemale = false;
const heightstyle =
    TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.w900);
int _currentSliderValue = 165;
const basicTextStyle = TextStyle(color: Colors.white, fontSize: 18.0);
int _weight = 50;
int _age = 18;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          activatedMale = true;
                          activatedFemale = false;
                        });
                      },
                      child: ReusableCard(
                        colour:
                            activatedMale ? activCardColor : inactiveCardColor,
                        cardChild: Gender(
                          genderName: 'MALE',
                          genWidget: FontAwesomeIcons.mars,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          activatedFemale = true;
                          activatedMale = false;
                        });
                      },
                      child: ReusableCard(
                        colour: activatedFemale
                            ? activCardColor
                            : inactiveCardColor,
                        cardChild: Gender(
                          genWidget: FontAwesomeIcons.venus,
                          genderName: 'FEMALE',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: Colors.black87,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: basicTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          _currentSliderValue.toString(),
                          style: heightstyle,
                        ),
                        Text(
                          'cm',
                          style: basicTextStyle,
                        ),
                      ],
                    ),
                    Slider(
                      activeColor: Color(0xFF5A189A),
                      inactiveColor: Color(0xFF5A189A),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value.toInt();
                        });
                      },
                      value: _currentSliderValue.toDouble(),
                      min: 120,
                      max: 220,
                      divisions: 100,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: Colors.black,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: basicTextStyle,
                          ),
                          Text(
                            _weight.toString(),
                            style: heightstyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    _weight++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  setState(() {
                                    _weight--;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: Colors.black,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: basicTextStyle,
                          ),
                          Text(
                            _age.toString(),
                            style: heightstyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    _age++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  setState(() {
                                    _age--;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Color(0xFF5A189A),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 80.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                        onPressed: () {
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultsPage(
                                    height1: _currentSliderValue,
                                    weight1: _weight),
                              ),
                            );
                          }
                        },
                        child: Text(
                          'Caluclate BMI',
                          style: TextStyle(color: Colors.white, fontSize: 35.0),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
