import 'package:open_medic/model/smith.dart';
import 'package:open_medic/view/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Smith3VPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SmithState();
}

class _SmithState extends State<Smith3VPage> {
  final _formKey = GlobalKey<FormState>();
  SmithDisplay _smithDisplay = SmithDisplay();

  Widget _result = Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    Text(
      "0.0",
      style: TextStyle(fontSize: 80.0, color: Colors.black),
    ),
    Text(
      "No result",
      style: TextStyle(fontSize: 20.0, color: Colors.black),
    )
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _result,
              /* DropdownButtonFormField(
                decoration: InputDecoration(enabledBorder: InputBorder.none),
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                isExpanded: true,
                items: dropdownQuestions,
                onChanged: (value) {},
              ),*/
              TextFormField(
                decoration: new InputDecoration(labelText: "ST elevation in V3, 60ms after J point", hintText: "in mm"),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [Common.digitInputFormatter],
                validator: (value) => (value.isEmpty) ? 'Please enter a number' : null,
                onSaved: (newValue) => {_smithDisplay.smith.stElevationInV3_60msAfterJ = double.parse(newValue)},
              ),
              TextFormField(
                decoration: new InputDecoration(labelText: "R Wave amplitude in V4", hintText: "in mm"),
                inputFormatters: [Common.digitInputFormatter],
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) => (value.isEmpty) ? 'Please enter a number' : null,
                onSaved: (newValue) => {_smithDisplay.smith.rAmplitudeInV4 = double.parse(newValue)},
              ),
              TextFormField(
                decoration: new InputDecoration(labelText: "QT Corrected", hintText: "in mm"),
                expands: false,
                inputFormatters: [Common.digitInputFormatter],
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) => (value.isEmpty) ? 'Please enter a number' : null,
                onSaved: (newValue) => {_smithDisplay.smith.qtInterval = double.parse(newValue)},
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _showMyDialog();
        }),
        tooltip: 'Information',
        child: Icon(Icons.info, size: 35),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            RaisedButton(
              onPressed: () {
                _formKey.currentState.reset();
                _result = _getEmptyScore();
                setState(() {});
              },
              child: Text('Clear'),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: Colors.grey,
            ),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  _result = _smithDisplay.getScore3V();
                  setState(() {});
                }
              },
              child: Text('Submit'),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: Colors.lightBlue,
            )
          ]),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Warning",
            style: TextStyle(color: Colors.red),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("It is critical to use it only when the differential is subtle LAD occlusion vs. early repol.\n"),
                Text("If there is LVH, it may not apply. If there are features that make LAD occlusion obvious"
                    " (inferior or anterior ST depression, convexity, terminal QRS distorsion, Q-waves), then the equation may NOT apply.\n"),
                Text("These kinds of cases were excluded from the study as obvious anterior STEMI.\n"),
                Text("ST elevation (STE) is measured 60 milliseconds after the J-point, relative to the PR segment, in millimiters."),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  List<DropdownMenuItem> _dropdownQuestions() {
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

  Column _getEmptyScore() {
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
