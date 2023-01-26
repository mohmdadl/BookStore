import 'package:bookstore/Screen/Fixed.dart';
import 'package:bookstore/Screen/widgets/My-Button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Book_add extends StatefulWidget {
  const Book_add({Key? key}) : super(key: key);

  @override
  State<Book_add> createState() => _Book_addState();
}

class _Book_addState extends State<Book_add> {
  bool loading = false;
  String name = "";
  String kind = "";
  String image = "";
  String price = "";

  addBook({
    required String name,
    required String kind,
    required String image,
    required String price,
  }) async {
    loading = true;
    setState(() {});
    try {
      CollectionReference Book =
      FirebaseFirestore.instance.collection('Book');
      await Book.add(
        {
          "name": name,
          "kind": kind,
          "image": image,
          "price": price,
        },
      );
      Navigator.of(context).pop();
      SnackBar snackBar = const SnackBar(
        content: Text('book added'),
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
          title: const Text("Book add",
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
              autofocus: true,
              style: TextStyle(color: secondaryColor),
              decoration: const InputDecoration(labelText: "kind" ,labelStyle: TextStyle(
                  color:secondaryColor)),
              onChanged: ((value) {
                kind = value;
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
            label: "Add  Book",
            onTap: () {
              addBook(name: name,kind: kind , image: image, price: price);
            },
          )
        ],
      ),
    );
  }
}
