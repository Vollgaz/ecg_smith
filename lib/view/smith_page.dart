import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SmithPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SmithState();
}

class _SmithState extends State<SmithPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DropdownButton(
            isExpanded: true,
            items: dropdownQuestions,
            onChanged: (value) {},
          )
        ],
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
  ].map(
          (value) => DropdownMenuItem(

            child: Row(children: [Checkbox(value: true,onChanged: (value){}), SizedBox(width: 300,child: Text(value))]),

          )
  ).toList();
}
