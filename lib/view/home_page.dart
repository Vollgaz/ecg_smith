import 'package:ecg_smith/view/smith_page.dart';
import 'package:ecg_smith/view/tidal_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("EG Smith"),
            bottom: TabBar(
              tabs: <Widget>[Icon(Icons.favorite, color: Colors.red), Icon(Icons.local_hospital, color: Colors.white)],
            ),
          ),
          body: TabBarView(
            children: <Widget>[SmithPage(), TidalPage()],
          ),
        ));
  }
}
