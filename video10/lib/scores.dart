import 'package:flutter/material.dart';

class Scores with ChangeNotifier{
  int midTermExam = 30;
  int finalExam = 30;

  decreseMidTerm() {
    midTermExam -= 1;
    notifyListeners();
  }
  increseMidTerm() {
    midTermExam += 1;
    notifyListeners();
  }
  decreseFinal() {
    finalExam -= 1;
    notifyListeners();
  }
  increseFinal() {
   finalExam += 1;
    notifyListeners();
  }
}

//한 페이지 안에서만
class DetailedScores with ChangeNotifier{
  int additionalMidterm = 10;
  int additionalFinal = 10;
}