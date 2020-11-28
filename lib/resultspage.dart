import 'package:flutter/material.dart';
import './card.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({this.height1, this.weight1});
  final int height1;
  final int weight1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResultPage(height: height1, weight: weight1),
    );
  }
}

class ResultPage extends StatefulWidget {
  ResultPage({this.height, this.weight});
  final int height;
  final int weight;
  @override
  _ResultPageState createState() => _ResultPageState(h: height, w: weight);
}

class _ResultPageState extends State<ResultPage> {
  _ResultPageState({this.h, this.w});
  final int h;
  final int w;

  int calculatebmi() {
    double _bmi = w / ((h / 100) * (h / 100));
    return _bmi.round();
  }

  String condition() {
    int _bmival = calculatebmi();
    if (_bmival >= 18.5 && _bmival <= 25) {
      return 'HEALTHY';
    } else if (_bmival > 25) {
      return 'OVERWEIGHT';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String comment() {
    int _bmival = calculatebmi();
    if (_bmival >= 18.5 && _bmival <= 25) {
      return 'You are perfectly alright!!';
    } else if (_bmival > 25) {
      return 'You have to exercise more or eat less buddy';
    } else {
      return 'You have to eat more and eat healthy';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: Colors.black,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    condition(),
                    style: TextStyle(
                      color: Colors.lightGreen,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    calculatebmi().toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    comment(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
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
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        {
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        'Re-caluclate BMI',
                        style: TextStyle(color: Colors.white, fontSize: 35.0),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
