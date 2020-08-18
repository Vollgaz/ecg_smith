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



}
