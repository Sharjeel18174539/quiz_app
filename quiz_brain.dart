import 'Question.dart';
//this class basically describe the concept of Abstraction.
class Quizbrain{
  int _questionNo=0;
  List<Question> _myquestion=[
    Question(q: 'Muslims believe that prophet Muhammad(PBUH) was one of many prophets.', a: true),
    Question(q: 'The hijra is the term for the migration of Muhammad and his followers from Mecca to Cairo.', a: false),
    Question(q: 'The language of the Qur’an is Arabic.' , a: true),
    Question(q:'There is only one source of Islamic law—the Sunnah',  a: false),
    Question(q: 'Muslims believe in the coming Day of Judgment.', a: true),
    Question(q: 'During the month of Ramadan, devout Muslims make the pilgrimage to Mecca.', a: false),
    Question(q: 'To make an effort, or to struggle is jihad', a: true),
    Question(q: 'Fish and honey are halal', a: true),
  ];
  void nextQuestion() {
    if (_questionNo < _myquestion.length - 1) {
      _questionNo++;
    }

    print(_questionNo);

    print(_myquestion.length);
  }
  String getQuestion(){
    return _myquestion[_questionNo].questionText;
  }
  bool getAnswer(){
     return _myquestion[_questionNo].questionAnswer;
  }
  bool isFinished() {
    if (_questionNo >= _myquestion.length - 1) {
      //TODO: Step 3 Part B - Use a print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.

      print('Now returning true');
      return true;

    } else {
      return false;
    }
  }

  //TODO: Step 4 part B - Create a reset() method here that sets the questionNumber back to 0.
  void reset() {
    _questionNo = 0;
  }
}

