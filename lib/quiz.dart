import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:quiz/model_class.dart';

class quiz extends StatefulWidget {
  const quiz({Key? key}) : super(key: key);

  @override
  State<quiz> createState() => _quizState();
}

class _quizState extends State<quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getqus(),
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 40,
            ),

            Center(
              child: TextButton(

                style: TextButton.styleFrom(
                    fixedSize: const Size(400, 80),
                    backgroundColor: Colors.green), onPressed: () {
                check(true);
              },
                child: Text(
                  'True',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                    fixedSize: const Size(400, 80),
                    backgroundColor: Colors.red), onPressed: () {
                check(false);
              },
                child: Text(
                  'False',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  List _question = [
    Quiz(qus: 'Serena Williams has one more '
        'singles tennis Grand Slam titles'
        ' than sister Venus', ans: true),
    Quiz(qus: 'Car have 4 wheels', ans: true),
    Quiz(qus: 'Bike have 3 wheels', ans: false),
    Quiz(qus: 'Sky color is blue', ans: true),
    Quiz(qus: 'human blood color is green', ans: false),
    Quiz(qus: 'Cat have 4 legs', ans: true),
    Quiz(qus: '125 less than 25', ans: false),
    Quiz(qus: 'malayalam is the mother of tongue', ans: true),
    Quiz(qus: 'kerala is the state of america', ans: false),
    Quiz(qus: 'india is asian country ', ans: true),
  ];

  List<Icon> ico = [];
  int count = 0;
  int _qusNo = 0;

  void nextQus() {
    if (_qusNo < _question.length) {
      _qusNo++;
    }
  }
  String getqus() {
    return _question[_qusNo].qus;
  }
  bool getAns() {
    return _question[_qusNo].ans;
  }
  bool isFinished() {
    if (_qusNo >= _question.length - 1) {
      return true;
    } else {
      return false;
    }
  }
  int reset() {
    _qusNo = 0;
    count = 0;
    return _qusNo;
  }
  void check(bool answer) {
    bool value = getAns();
    setState(() {
      if (isFinished() == true) {
        if (count <= 5) {
          Alert(
              context: context, title: 'THE END', desc: 'You are failed')
              .show();
          reset();
          ico = [];
        }
        else {
          Alert(
              context: context,
              title: 'THE END', desc: 'You are Passed with $count marks')
              .show();
          reset();
          ico = [];
        }
      }
      else {
        if (value == answer) {
          print(count);
          ico.add(Icon(Icons.check,
            color: Colors.green,));
          count++;
        }
        else {
          ico.add(Icon(Icons.close, color: Colors.red,));
        }
        nextQus();
      }
    });
  }
}