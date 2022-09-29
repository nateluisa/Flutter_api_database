import 'package:flutter/material.dart';

class MainCards extends StatelessWidget {
  const MainCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.deepPurple[10],
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      height: 1000,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 200.0,
            color: Colors.deepPurple[900],
          ),
          Container(
            width: 200.0,
            color: Colors.deepPurple[700],
          ),
          Container(
            width: 200.0,
            color: Colors.deepPurple[500],
          ),
          Container(
            width: 200.0,
            color: Colors.deepPurple[300],
          ),
          Container(
            width: 200.0,
            color: Colors.deepPurple[100],
          ),
        ],
      ),
    );
  }
}
