import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Smith {
  // value in millimeters
  double stElevationInV3_60msAfterJ = 0.0;

  // value in millimeters ?
  // TODO : Check unit
  double qrsAmplitudeInV2 = 0.0;

  // value in millimeters
  double rAmplitudeInV4 = 0.0;

  // value in millimeters
  double qtInterval = 0.0;

  Smith({this.qtInterval, this.stElevationInV3_60msAfterJ, this.rAmplitudeInV4, this.qrsAmplitudeInV2});

  double smithScore4Variables() {
    return 1.062 * stElevationInV3_60msAfterJ + 0.052 * qtInterval - 0.268 * rAmplitudeInV4 - 0.151 * qrsAmplitudeInV2;
  }

  double smithScore3Variables() {
    return 1.196 * stElevationInV3_60msAfterJ + 0.059 * qtInterval - 0.326 * rAmplitudeInV4;
  }
}

class SmithDisplay {
  Smith smith = Smith();

  Column getScore4V() {
    double score = this.smith.smithScore3Variables();
    if (score > 18.2) {
      return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          "${score.toStringAsFixed(2)}",
          style: TextStyle(fontSize: 80.0, color: Colors.red),
        ),
        Text(
          "Consider STEMI",
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



  Column getScore3V() {
    double score = this.smith.smithScore3Variables();
    if (score > 23.4) {
      return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          "${score.toStringAsFixed(2)}",
          style: TextStyle(fontSize: 80.0, color: Colors.red),
        ),
        Text(
          "Consider STEMI",
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

  static List<DropdownMenuItem> dropdownQuestions() {
    return [
      "Is there a bundle branch block?",
      "Is the T-wave inverted in any of V2-V6, but not due to benign T-wave inversion?",
      "Is the ST-segment elevated >5mm in any lead?",
      "Is terminal QRS distorsion present in V2 and V3?",
      "Do any of leads V2-V6 have a convex ST-segment?",
      "Is there significant ST-depression in II, III, or aVF?",
      "Is there ST depression in V2-V6?",
      "Are there pathologic Q-waves in any of V2-V4?"
    ]
        .map((value) => DropdownMenuItem(
      child: Row(children: [Checkbox(value: true, onChanged: (value) {}), SizedBox(width: 300, child: Text(value))]),
    ))
        .toList();
  }


}
