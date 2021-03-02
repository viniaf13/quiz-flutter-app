import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizBrain {
  int _scorePoints = 0;
  List<Icon> _scoreIcons = [];
  int _questionNumber = 0;
  List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  void _nextQuestion(BuildContext context, int scorePoints) {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    } else {
      Alert(
          title: "The quiz reached the end",
          desc: "You did $scorePoints points.",
          context: context,
          buttons: [
            DialogButton(
              child: Text(
                "Restart Quiz",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              color: Color.fromRGBO(0, 179, 134, 1.0),
              radius: BorderRadius.circular(0.0),
            )
          ]).show();
      _questionNumber = 0;
      _scoreIcons = [];
      _scorePoints = 0;
    }
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].answer;
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].text;
  }

  List<Icon> getScoreIcons() {
    return _scoreIcons;
  }

  void setUserScore(bool correctAnswer, BuildContext context) {
    Icon answerIcon = _checkUserAnswer(correctAnswer);
    _scoreIcons.add(answerIcon);
    _nextQuestion(context, _scorePoints);
  }

  Icon _checkUserAnswer(bool userAnswer) {
    Icon checkIcon = Icon(Icons.check, color: Colors.green);
    Icon closeIcon = Icon(Icons.close, color: Colors.red);
    if (getCorrectAnswer() == userAnswer) {
      _scorePoints++;
      return checkIcon;
    } else {
      return closeIcon;
    }
  }
}
