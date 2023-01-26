import 'package:bookstore/Screen/Fixed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class appInfoScreen extends StatefulWidget {
  const appInfoScreen({Key? key}) : super(key: key);

  @override
  State<appInfoScreen> createState() => _appInfoScreenState();
}

class _appInfoScreenState extends State<appInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: secondaryColor,
            iconTheme: const IconThemeData(color: primaryColor),
            title:
                const Text("about app", style: TextStyle(color: primaryColor))),
        body: Column(
          children: const [
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
                child: Text(
                  "Books library",
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 1.2,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                "version: 1.0.0",
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  wordSpacing: 1.2,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "This application is a library of books of various kinds, such as comedy, horror, movement, mystery or documentary.",
                style: TextStyle(
                    color: secondaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                    wordSpacing: 1.2,
                    height: 1.3),
              ),
            )
          ],
        ));
  }
}
