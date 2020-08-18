import 'package:ecg_smith/model/smith.dart';
import 'package:test/test.dart';

void main() {
  test("smithScore4Variables should be equal to 21.09 ", () {
    Smith smith = Smith(rAmplitudeInV4: 2.0, stElevationInV3_60msAfterJ: 2.5, qrsAmplitudeInV2: 19.0, qtInterval: 420.0);
    
    expect(smith.smithScore4Variables(), closeTo(21.09, 0.01));
  });

  test("smithScore3Variables should be equal to 27.11 ", () {
    Smith smith = Smith(rAmplitudeInV4: 2.0, stElevationInV3_60msAfterJ: 2.5, qtInterval: 420.0);

    expect(smith.smithScore3Variables(), closeTo(27.11, 0.01));
  });
}
