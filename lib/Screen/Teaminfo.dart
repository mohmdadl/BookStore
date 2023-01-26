import 'package:bookstore/Screen/Fixed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class teamInfoScreen extends StatefulWidget {
  const teamInfoScreen({Key? key}) : super(key: key);

  @override
  State<teamInfoScreen> createState() => _teamInfoScreenState();
}

class _teamInfoScreenState extends State<teamInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: secondaryColor,
          iconTheme: IconThemeData(color: primaryColor),title: const Text("Team info",style: TextStyle(color: primaryColor))),
      body: Column(children: const [
        Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: Text(
            "1 - Eslam Mohamed salah eldeen mahmoud ",
            
            style: TextStyle(
                color: secondaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                height: 1.3),
          ),
              
        )
      ]),
    );
  }
}
