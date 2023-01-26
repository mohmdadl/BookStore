import 'package:bookstore/Screen/Fixed.dart';
import 'package:bookstore/Screen/widgets/My-Button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Action_book_add extends StatefulWidget {
  const Action_book_add({Key? key}) : super(key: key);

  @override
  State<Action_book_add> createState() => _Action_book_addState();
}

class _Action_book_addState extends State<Action_book_add> {
  bool loading = false;
  String name = "";
  String image = "";
  String price = "";

  addActionbook({
    required String name,
    required String image,
    required String price,
  }) async {
    loading = true;
    setState(() {});
    try {
      CollectionReference Action_Book =
          FirebaseFirestore.instance.collection('Action_Book');
      await Action_Book.add(
        {
          "name": name,
          "image": image,
          "price": price,
        },
      );
      Navigator.of(context).pop();
      SnackBar snackBar = const SnackBar(
        content: Text('Action book added'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e) {
      SnackBar snackBar = const SnackBar(
        content: Text('Error happened'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
          iconTheme: IconThemeData(color: primaryColor),
          title: const Text("Action Book add",
              style: TextStyle(color: primaryColor))),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    cursorColor: secondaryColor,
                    autofocus: true,
                    style: TextStyle(color: secondaryColor),
                    decoration: const InputDecoration(labelText: "name" ,labelStyle: TextStyle(
                        color:secondaryColor)),
                    onChanged: ((value) {
                      name = value;
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    cursorColor: secondaryColor,
                    style: TextStyle(color: secondaryColor),
                    decoration: const InputDecoration(labelText: "image",labelStyle: TextStyle(
                        color:secondaryColor)),
                    onChanged: ((value) {
                      image = value;
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    cursorColor: secondaryColor,
                    style: TextStyle(color: secondaryColor),
                    decoration: const InputDecoration(
                      labelText: "price",labelStyle: TextStyle(
                        color:secondaryColor)
                    ),
                    onChanged: ((value) {
                      price = value;
                    }),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                  label: "Add Action Book",
                  onTap: () {
                    addActionbook(name: name, image: image, price: price);
                  },
                )
              ],
            ),
    );
  }
}
