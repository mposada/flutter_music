import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workshop/ui/routes/albums_route.dart';
import 'package:workshop/ui/routes/tracks_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zemoga Workshop',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(icon: Icon(Icons.sort), onPressed: () {}),
          title: Text("Music"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
          ],
          bottom: TabBar(tabs: [
            Tab(text: "TRACKS"),
            Tab(text: "ALBUMS"),
          ]),
        ),
        body: TabBarView(
          children: [
            TracksRoute(),
            AlbumsRoute()
          ]
        ),
      )
    );
  }
}

//
