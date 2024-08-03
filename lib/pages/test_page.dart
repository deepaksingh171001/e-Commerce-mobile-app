import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  var i = 1;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
          child: Column(
        children: [
          Text("count $i"),
          ElevatedButton(
              onPressed: () {
                i = i + 1;
                setState(() {});
              },
              child: Text("Press"))
        ],
      )),
    );
  }
}
