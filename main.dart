// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quizbrain myquiz= Quizbrain();
void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Center(child: Text("Quiz App")),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}
class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}
// Question can be written in this form also without using class but it is more lengthy because we have to create
// one more list for answer.\\
//List<bool> answer=[true, false, true,false];

//List<String> Questions=[
 // 'Muslims believe that Muhammad was one of many prophets.',
 // 'The hijra is the term for the migration of Muhammad and his followers from Mecca to Cairo.',
 // 'The language of the Qur’an is Arabic.',
 // 'There is only one source of Islamic law—the Sunnah',



class _QuizPageState extends State<QuizPage> {
  List<Icon> scorekeeper=[];
  void checkedAns(bool pickedAns){
    bool correct=myquiz.getAnswer();

    setState(() {
      if(myquiz.isFinished() == true){
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        //TODO Step 4 Part C - reset the questionNumber,
        myquiz.reset();

        //TODO Step 4 Part D - empty out the scoreKeeper.
        scorekeeper = [];
      }
      else{
        if(pickedAns==correct){
          scorekeeper.add(const Icon(
            Icons.check,
            color: Colors.green,
          ),
          );

        }
        else{
          scorekeeper.add(const Icon(Icons.close, color: Colors.red,),);
        }

      }
      myquiz.nextQuestion();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
         Expanded(
           flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                myquiz.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.green,
                child: Text("True",
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 25.0,
                 ),
                ),
                onPressed: (){
                  checkedAns(true);
                },
              ),
            )

        ),
           Expanded(
             child: Padding(
               padding: EdgeInsets.all(15.0),
               child: FlatButton(
                 color: Colors.red,
                 child: Text("False",
                 style: TextStyle(
                   fontSize: 25.0,
                   color: Colors.white,
                 ),
                 ),
                 onPressed: (){
                   checkedAns(false);
                 },
               ),
             ),
           ),
           Row(
             children: scorekeeper,
           )

           // this row is for score keeper.

      ],
    );
  }
}

