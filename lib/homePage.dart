import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: Scaffold(
         appBar: new AppBar(
           title: Text("Home Page"),
         ),
         body: Text("HiHi Successfull"),
      ),
    );
  }
}