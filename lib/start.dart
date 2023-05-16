import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';

class start extends StatefulWidget {
  const start({Key? key}) : super(key: key);

  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(children: [
          SizedBox(
            height: 200,
          ),
          CircleAvatar(
            backgroundImage: AssetImage('img/qstn.jpg'),
            radius: 80,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
              style: TextStyle(
                color: Colors.teal,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
              'QUIZO'),
          SizedBox(
            height: 100,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const quiz()),
                );
              },
              child: Center(child: Text('START',style: TextStyle(color:Colors.teal,),)))
        ]));
  }
}
