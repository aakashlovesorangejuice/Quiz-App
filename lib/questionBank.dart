
import 'package:flutter/cupertino.dart';
import 'package:quiz_app/question.dart';

class QuestionBank{
  int questionNum=0;
  List<Icon> scoreKeeper=[];
  List<Question> _questions = [
    Question('Does falling asleep a normal behaviour?',true),
    Question('Is Jashpur city called the pink city of India?',false),
    Question('Is 2+2=4 right?',true),
    Question('Does human body has 200 bones?',false),
    Question('Is worlds best time for solving Rubik\'s cube < 5s?',true),
    Question('Is cube root of 729 equals 8?',false),
    Question('Is human teeth made of Calcium phosphate?',true),
    Question('Is watching porn a crime?',true),
    Question('Is watching Netflix a crime?',false),
    Question('Does India still contains lost treasures?',true),
    Question('Corruption will stop in the world someday.',false),
    Question('India is the land of gods.',true),
    Question('Sun rises from the east',true),
    //Question('You got $total right answers,',true),
  ];
   nextQues(){
    if(questionNum < _questions.length-1) {
      questionNum++;
    }
    else{
      questionNum=0;
    }
  }

  String getNextQuestion()
  {
      return _questions[questionNum].question;
  }
  bool getCorrectAnswer()
  {
    return _questions[questionNum].answer;
  }
}