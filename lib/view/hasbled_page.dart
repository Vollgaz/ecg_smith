import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_medic/model/hasbled.dart';

class HASBLEDPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HASBLEDState();
}

class _HASBLEDState extends State<HASBLEDPage> {
  final _formKey = GlobalKey<FormState>();

  HasbledDisplay hasbledDisplay = new HasbledDisplay();

  Widget _result = HasbledDisplay.getEmptyScore();

  void updateResult() {
    _result = hasbledDisplay.getScore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          _result,
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CheckboxListTile(
                  title: Text("Arterial hypertension"),
                  value: hasbledDisplay.hasbled.isThereHypertension,
                  onChanged: (val) {
                    setState(() {
                      hasbledDisplay.hasbled.isThereHypertension = val;
                      updateResult();
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Abnormal renal function"),
                  value: hasbledDisplay.hasbled.isThereRenalProblem,
                  onChanged: (val) {
                    setState(() {
                      hasbledDisplay.hasbled.isThereRenalProblem = val;
                      updateResult();
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Abnormal liver function"),
                  value: hasbledDisplay.hasbled.isThereLiverProblem,
                  onChanged: (val) {
                    setState(() {
                      hasbledDisplay.hasbled.isThereLiverProblem = val;
                      updateResult();
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Older than 65"),
                  value: hasbledDisplay.hasbled.isOlderThan65,
                  onChanged: (val) {
                    setState(() {
                      hasbledDisplay.hasbled.isOlderThan65 = val;
                      updateResult();
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Stroke antecedent"),
                  value: hasbledDisplay.hasbled.isThereStrokeAntecedent,
                  onChanged: (val) {
                    setState(() {
                      hasbledDisplay.hasbled.isThereStrokeAntecedent = val;
                      updateResult();
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Major bleeding antecedent"),
                  value: hasbledDisplay.hasbled.isThereBleedingAntecedent,
                  onChanged: (val) {
                    setState(() {
                      hasbledDisplay.hasbled.isThereBleedingAntecedent = val;
                      updateResult();
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Labile INR"),
                  value: hasbledDisplay.hasbled.isThereLabileINR,
                  onChanged: (val) {
                    setState(() {
                      hasbledDisplay.hasbled.isThereLabileINR = val;
                      updateResult();
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Alcohol consumption"),
                  value: hasbledDisplay.hasbled.isThereAlcoholism,
                  onChanged: (val) {
                    setState(() {
                      hasbledDisplay.hasbled.isThereAlcoholism = val;
                      updateResult();
                    });
                  },
                ),
              ],
            ),
          )
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            RaisedButton(
              onPressed: () {
                setState(() {
                  _formKey.currentState.reset();
                  hasbledDisplay = new HasbledDisplay();
                  updateResult();
                });
              },
              child: Text('Clear'),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: Colors.grey,
            )
          ]),
        ),
      ),
    );
  }
}
