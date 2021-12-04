import 'package:ausome_fap/KidGames/match_the_item_model/item_question.dart';

class MatchBrain {
  int _questionNumber = 0;

  List<ItemQuestion> _questionBank = [
    ItemQuestion('table.png', 'Table', 'Chair', 'Table'),
    ItemQuestion('box.png', 'Box', 'Plastic', 'Box'),
    ItemQuestion('toothbrush.png', 'Toothpick', 'Toothbrush', 'Toothbrush'),
    ItemQuestion('car.png', 'Car', 'Bus', 'Car'),
    ItemQuestion('tent.png', 'House', 'Tent', 'Tent'),
    ItemQuestion('cookie.png', 'Cookie', 'Ice Cream', 'Cookie'),
    ItemQuestion('hat.png', 'Bucket', 'Hat', 'Hat'),
    ItemQuestion('crayons.png', 'Pencil', 'Crayon', 'Crayon'),
    ItemQuestion('dog.png', 'Cat', 'Dog', 'Dog'),
    ItemQuestion('flower.png', 'Flower', 'Tree', 'Flower'),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getImage() {
    return _questionBank[_questionNumber].itemImagePath;
  }

  String getChoice1() {
    return _questionBank[_questionNumber].choice1;
  }

  String getChoice2() {
    return _questionBank[_questionNumber].choice2;
  }

  String getAnswer() {
    return _questionBank[_questionNumber].itemName;
  }

  bool isFinished() {
    return _questionNumber == _questionBank.length - 1;
  }

  void reset() {
    _questionNumber = 0;
  }

  int getQuestionNumer() {
    return _questionNumber;
  }
}
