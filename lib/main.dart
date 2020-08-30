
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'questionBank.dart';
void main() => runApp(QuizApp());


class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          title: Text(
            'Welcome to Quiz App',
          ),
          centerTitle: true,
        ),
        body: Quizzie(),
        backgroundColor: Colors.grey[900],
      ),
    );
  }
}
class Quizzie extends StatefulWidget {
  @override
  _QuizzieState createState() => _QuizzieState();
}

class _QuizzieState extends State<Quizzie> {
  int total=0;
  QuestionBank questionBank=QuestionBank();


  void setNewIcon(bool userPicked){

    setState(() {
      if(questionBank.getCorrectAnswer()==userPicked) {
        total++;
        questionBank.scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ),);
      }
      else{
        questionBank.scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ),);
      }
      questionBank.nextQues();
      if(questionBank.questionNum==0){
        Future.delayed(Duration(seconds: 1),(){
          questionBank.scoreKeeper.clear();
      }
      );
        Alert(context: context,type: AlertType.success,title: 'Quiz Over',desc: 'You got $total correct answers. Resetting the Quiz').show();
        total=0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                  questionBank.getNextQuestion(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: RaisedButton(
              color:Colors.green[600],
              onPressed: (){
                setNewIcon(true);
              },
              child: Text(
                'True',
                style: TextStyle(fontSize: 20.0,color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: RaisedButton(
              color:Colors.red[400],
              onPressed: (){

                setNewIcon(false);

              },
              child: Text(
                'False',
                style: TextStyle(fontSize: 20.0,color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Expanded(
            child: Row(
              children: questionBank.scoreKeeper,
            ),
          ),
        ],
      ),
    );
  }
}



