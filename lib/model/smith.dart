class Smith {
  double stElevationInV360msAfterJ;

  double qrsAmplitudeInV2;

  double rAmplitudeInV4;

  double rrInterval;

  double rrIntervalCorrection = 1;

  double qtInterval;

  double qtIntervalCorrection = 1;

  Smith({this.rrInterval, this.qtInterval, this.stElevationInV360msAfterJ, this.rAmplitudeInV4, this.qrsAmplitudeInV2});

  double  smithScore() {
    return 1.062 * stElevationInV360msAfterJ + 0.052 * qtInterval - 0.268 * rAmplitudeInV4 - 0.151 * qrsAmplitudeInV2;
  }



}
