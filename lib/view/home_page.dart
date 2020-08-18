import 'package:ecg_smith/view/smith_3v_page.dart';
import 'package:ecg_smith/view/smith_4v_page.dart';
import 'package:ecg_smith/view/tidal_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            title: Text("ECG Smith"),
            bottom: TabBar(
              isScrollable: true,
              labelStyle:TextStyle(fontSize: 15),
              tabs: <Widget>[Text("ECG 4V"), Text("ECG 3V"), Text("Tidal"), Text("stuff"),Text("stuff"),Text("stuff")],
            ),
          ),
          body: TabBarView(
            children: <Widget>[Smith4VPage(), Smith3VPage(), TidalPage(), Text("dfgfdg"),Text("stuff"),Text("stuff")],
          ),
        ));
  }
}
