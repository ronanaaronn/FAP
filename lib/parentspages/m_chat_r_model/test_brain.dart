import 'question.dart';

class TestBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question(
        'If you point at something across the room, does your child look at it? (FOR EXAMPLE, if you point at a toy or an animal, does your child look at the toy or animal?)',
        false),
    Question('Have you ever wondered if your child might be deaf?', true),
    Question(
        'Does your child play pretend or make-believe? (FOR EXAMPLE, pretend to drink from an empty cup, pretend to talk on a phone, or pretend to feed a doll or stuffed animal?)',
        false),
    Question(
        'Does your child like climbing on things? (FOR EXAMPLE, furniture, playground equipment, or stairs)',
        false),
    Question(
        'Does your child make unusual finger movements near his or her eyes? (FOR EXAMPLE, does your child wiggle his or her fingers close to his or her eyes?)',
        true),
    Question(
        'Does your child point with one finger to ask for something or to get help? (FOR EXAMPLE, pointing to a snack or toy that is out of reach)',
        false),
    Question(
        'Does your child point with one finger to show you something interesting? (FOR EXAMPLE, pointing to an airplane in the sky or a big truck in the road)',
        false),
    Question(
        'Is your child interested in other children? (FOR EXAMPLE, does your child watch other children, smile at them, or go to them?)',
        false),
    Question(
        'Does your child show you things by bringing them to you or holding them up for you to see – not to get help, but just to share? (FOR EXAMPLE, showing you a flower, a stuffed animal, or a toy truck)',
        false),
    Question(
        'Does your child respond when you call his or her name? (FOR EXAMPLE, does he or she look up, talk or babble, or stop what he or she is doing when you call his or her name?)',
        false),
    Question('When you smile at your child, does he or she smile back at you?',
        false),
    Question(
        'Does your child get upset by everyday noises? (FOR EXAMPLE, does your child scream or cry to noise such as a vacuum cleaner or loud music?)',
        true),
    Question('Does your child walk?', false),
    Question(
        'Does your child look you in the eye when you are talking to him or her, playing with him or her, or dressing him or her?',
        false),
    Question(
        'Does your child try to copy what you do? (FOR EXAMPLE, wave bye-bye, clap, or make a funny noise when you do)',
        false),
    Question(
        'If you turn your head to look at something, does your child look around to see what you are looking at?',
        false),
    Question(
        'Does your child try to get you to watch him or her? (FOR EXAMPLE, does your child look at you for praise, or say “look” or “watch me”?',
        false),
    Question(
        'Does your child understand when you tell him or her to do something? (FOR EXAMPLE, if you don’t point, can your child understand “put the book on the chair” or “bring me the blanket”?)',
        false),
    Question(
        'If something new happens, does your child look at your face to see how you feel about it? (FOR EXAMPLE, if he or she hears a strange or funny noise, or sees a new toy, will he or she look at your face?)',
        false),
    Question(
        'Does your child like movement activities? (FOR EXAMPLE, being swung or bounced on your knee)',
        false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getASDRisk() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    return _questionNumber == _questionBank.length - 1;
  }

  // void reset() {
  //   _questionNumber = 0;
  // }

  int getQuestionNumer() {
    return _questionNumber;
  }

  String getRisk(int total) {
    if (total >= 0 && total <= 2) {
      return 'Low Risk';
    } else if (total >= 3 && total <= 7) {
      return 'Medium Risk';
    } else {
      return 'High Risk';
    }
  }

  String getInterpretation(int total) {
    if (total >= 0 && total <= 2) {
      return 'The score is LOW risk. No Follow-Up needed. Child has screened negative. Rescreen at 24 months if the child is younger than 2 years old (or after 3 months has elapsed), and refer as needed if developmental surveillance or other tools suggest risk for ASD.';
    } else if (total >= 3 && total <= 7) {
      return 'The score indicates medium risk. This means you should to take your child to his or her doctor for a follow-up screening. You can also seek early intervention services for your child.';
    } else {
      return 'Score indicates high risk. This means you should to take your child to his or her doctor for a full evaluation. You should also begin early intervention services for your child.';
    }
  }
}
