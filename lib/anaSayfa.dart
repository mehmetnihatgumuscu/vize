import 'package:flutter/material.dart';

class anaSayfa extends StatelessWidget {
  const anaSayfa({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("192855097"),
        ),
      ),
      body: GridView(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        children: <Widget>[
          Container(
            color: Colors.red,
            margin: EdgeInsets.all(2),
            child: Text("1"),
          ),
          Container(
            color: Colors.red,
            margin: EdgeInsets.all(2),
            child: Text("2"),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.all(3),
            child: Text("3"),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.all(2),
            child: Text("4"),
          ),
          Container(
            color: Colors.red,
            margin: EdgeInsets.all(2),
            child: Text("5"),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.all(2),
            child: Text("6"),
          ),
          Container(
            color: Colors.red,
            margin: EdgeInsets.all(2),
            child: Text("7"),
          ),
          Container(
            color: Colors.red,
            margin: EdgeInsets.all(2),
            child: Text("8"),
          ),
          Container(
            color: Colors.red,
            margin: EdgeInsets.all(2),
            child: Text("9"),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.all(2),
            child: Text("10"),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.all(2),
            child: Text("11"),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.all(2),
            child: Text("12"),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.all(2),
            child: Text("13"),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.all(2),
            child: Text("14"),
          ),
          Container(
            color: Colors.red,
            margin: EdgeInsets.all(2),
            child: Text("15"),
          ),
          Container(
            color: Colors.red,
            margin: EdgeInsets.all(2),
            child: Text("16"),
          ),
          Container(
            color: Colors.red,
            margin: EdgeInsets.all(2),
            child: Text("17"),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.all(2),
            child: Text("18"),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.all(2),
            child: Text("19"),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.all(2),
            child: Text("20"),
          ),
        ],
      ),
    );
  }
}
