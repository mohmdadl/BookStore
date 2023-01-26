import 'package:bookstore/Screen/Fixed.dart';
import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  String label;
  void Function()? onTap;
  MyButton({Key? key, required this.label, required this.onTap}) : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 120,
          height: 40,
          decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(50.0)),
          child: Center(child: Text(widget.label)),
        ),
      ),
    );
  }
}
