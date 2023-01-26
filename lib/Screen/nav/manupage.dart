import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class menupage extends StatefulWidget {
  const menupage({Key? key}) : super(key: key);

  @override
  State<menupage> createState() => _menupageState();
}

class _menupageState extends State<menupage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column( children: [
          SizedBox(
            height: 20,
          ),
          Center(child: Text("Menu", style: TextStyle(fontSize: 30 , color: Colors.black),))
        ],)
    );
  }
}
