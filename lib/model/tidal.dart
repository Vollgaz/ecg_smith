class TidalVolume {
  // Ratio associated to the patient s sex
  double sexRatio;

  // Patient s height in centimeters
  double height;

  // Ideal volume in milliLiter per kiloGrammes.
  double idealVolume;

  // Constructor
  TidalVolume({this.sexRatio, this.height, this.idealVolume});

  // Return the TIDAL Volume for the patient.
  int realVolume() {
    return (idealVolume * (sexRatio + 0.91 * (height - 152.4))).floor();
  }
}
