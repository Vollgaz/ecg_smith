import 'package:ecg_smith/model/smith.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class SmithPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SmithState();
}

class _SmithState extends State<SmithPage> {
  final _formKey = GlobalKey<FormState>();
  Smith _smith = new Smith();
  double _score = 0.0;
  String _avis = "";
  Color _color = Colors.black;

  void fillResult() {
    _score = _smith.smithScore();
    if (_score > 18.2) {
      _avis = "STEMI requiered";
      _color = Colors.red;
    } else {
      _avis = "Consider normal";
      _color = Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "${_score.toStringAsFixed(1)}",
                style: TextStyle(fontSize: 80.0, color: _color),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Text(
                  "$_avis",
                  style: TextStyle(fontSize: 20.0, color: _color),
                ),
              ),
            ]),
            DropdownButtonFormField(
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              isExpanded: true,
              items: dropdownQuestions,
              onChanged: (value) {},
            ),
            TextFormField(
              decoration: new InputDecoration(labelText: "ST elevation in V3, 60ms after J point"),
              keyboardType: TextInputType.number,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              validator: (value) => (value.isEmpty) ? 'Please enter a number' : null,
              onSaved: (newValue) => {_smith.stElevationInV360msAfterJ = double.parse(newValue)},
            ),
            TextFormField(
              decoration: new InputDecoration(labelText: "QRS amplitude in V2"),
              keyboardType: TextInputType.number,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              validator: (value) => (value.isEmpty) ? 'Please enter a number' : null,
              onSaved: (newValue) => {_smith.qrsAmplitudeInV2 = double.parse(newValue)},
            ),
            TextFormField(
              decoration: new InputDecoration(labelText: "R Wave amplitude in V4"),
              keyboardType: TextInputType.number,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              validator: (value) => (value.isEmpty) ? 'Please enter a number' : null,
              onSaved: (newValue) => {_smith.rAmplitudeInV4 = double.parse(newValue)},
            ),
            Row(children: [
              Flexible(
                flex: 2,
                child: TextFormField(
                  decoration: new InputDecoration(labelText: "RR interval"),
                  keyboardType: TextInputType.number,
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  validator: (value) => (value.isEmpty) ? 'Please enter a number' : null,
                  onSaved: (newValue) => {_smith.rrInterval = double.parse(newValue)},
                ),
              ),
              Flexible(
                flex: 1,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(enabledBorder: InputBorder.none),
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  items: [
                    DropdownMenuItem(child: Text("mm")),
                    DropdownMenuItem(child: Text("ms")),
                    DropdownMenuItem(child: Text("bpm")),
                  ],
                  onChanged: (value) {},
                ),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Flexible(
                flex: 2,
                child: TextFormField(
                  decoration: new InputDecoration(
                    labelText: "QT Uncorrected",
                  ),
                  expands: false,
                  keyboardType: TextInputType.number,
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  validator: (value) => (value.isEmpty) ? 'Please enter a number' : null,
                  onSaved: (newValue) => {_smith.qtInterval = double.parse(newValue)},
                ),
              ),
              Flexible(
                  flex: 1,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(enabledBorder: InputBorder.none,),
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    items: [
                      DropdownMenuItem(child: Text("mm")),
                      DropdownMenuItem(child: Text("ms")),
                    ],
                    onChanged: (value) {},
                  ))
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.reset();
                    _smith = new Smith();
                    _score = 0.0;
                    setState(() {});
                  }
                },
                child: Text('Clear'),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Colors.grey,
              ),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    fillResult();
                    setState(() {});
                  }
                },
                child: Text('Submit'),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Colors.lightBlue,
              )
            ])
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem> dropdownQuestions = [
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
