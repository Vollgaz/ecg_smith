import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Hasbled {
  bool isThereHypertension = false;

  bool isThereRenalProblem = false;

  bool isThereLiverProblem = false;

  bool isThereStrokeAntecedent = false;

  bool isThereBleedingAntecedent = false;

  bool isOlderThan65 = false;

  bool isThereLabileINR = false;

  bool isThereSpecificDrugs = false;

  bool isThereAlcoholism = false;

  int getHasbledScore() {
    return [
      this.isThereHypertension,
      this.isThereRenalProblem,
      this.isThereLiverProblem,
      this.isThereStrokeAntecedent,
      this.isThereBleedingAntecedent,
      this.isOlderThan65,
      this.isThereLabileINR,
      this.isThereSpecificDrugs,
      this.isThereAlcoholism
    ].where((element) => element == true).length;
  }
}

class HasbledDisplay {
  Hasbled hasbled = Hasbled();

  Column getScore() {
    int score = this.hasbled.getHasbledScore();
    if (score >= 3) {
      return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          "${score.toStringAsFixed(2)}",
          style: TextStyle(fontSize: 80.0, color: Colors.red),
        ),
        Text(
          "High Risk",
          style: TextStyle(fontSize: 20.0, color: Colors.red),
        )
      ]);
    } else {
      return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          "${score.toStringAsFixed(2)}",
          style: TextStyle(fontSize: 80.0, color: Colors.green),
        ),
        Text(
          "Normal",
          style: TextStyle(fontSize: 20.0, color: Colors.green),
        )
      ]);
    }
  }

  static Column getEmptyScore() {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Text(
        "0.0",
        style: TextStyle(fontSize: 80.0, color: Colors.black),
      ),
      Text(
        "No result",
        style: TextStyle(fontSize: 20.0, color: Colors.black),
      )
    ]);
  }
}
