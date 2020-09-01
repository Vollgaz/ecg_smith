import 'package:open_medic/view/smith_3v_page.dart';
import 'package:open_medic/view/smith_4v_page.dart';
import 'package:open_medic/view/tidal_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  String title = "Open Medic";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            title: Text("$title"),
            bottom: TabBar(
              isScrollable: true,

              labelStyle:TextStyle(fontSize: 15),
              tabs: <Widget>[Text("ECG 4V"), Text("ECG 3V"), Text("Tidal")],
            ),
          ),
          body: TabBarView(
            children: <Widget>[Smith4VPage(), Smith3VPage(), TidalPage()],
          ),

        ));
  }




}
