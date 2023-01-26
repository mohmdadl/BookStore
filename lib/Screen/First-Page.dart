import 'package:bookstore/Screen/Fixed.dart';
import 'package:bookstore/Screen/appinfo.dart';
import 'package:bookstore/addBooks/Book_add.dart';
import '../Screen/Teaminfo.dart';
import 'package:bookstore/Screen/search-page-screen.dart';
import 'package:bookstore/Screen/signin-page.dart';
import 'package:bookstore/addBooks/%D8%A3HorrorBook_add.dart';
import 'package:bookstore/addBooks/RomanticBook_add.dart';
import '../addBooks/ActionBook_add.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'nav/Homepage-Screen.dart';
import 'nav/ProfilePage.dart';
import 'nav/manupage.dart';

class FirstPage extends StatefulWidget {
  String email = "";
  String password = "";

  FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int currentIndex = 0;
  List<Widget> page = [
    const Homepage_Screen(),
    const ProfilePage(),
    const menupage()
  ];

  onIndexChange(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,iconTheme: IconThemeData(color: primaryColor),
        title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              width: double.infinity,
              color: primaryColor,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'search in bookstore',hintStyle: TextStyle(color: secondaryColor),
                    prefixIcon: Icon(Icons.search,color: secondaryColor),
                  ),
                  // onTap: () => Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => Search_page_screen()),
                  // ),
                ),
              ),
            )),
      ),
      body: page[currentIndex],
      drawer: Drawer(
        backgroundColor: primaryColor,
        child: ListView(
          children: [
            ListTile(
                title: const Text("Book_add", style: TextStyle(color: secondaryColor)),
                subtitle: const Text("Add a new book", style: TextStyle(color: secondaryColor)),
                trailing: const Icon(Icons.book, color: secondaryColor),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Book_add()),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            ListTile(
                title: const Text("Horror_Book_add", style: TextStyle(color: secondaryColor)),
                subtitle: const Text("Add a new Horror book", style: TextStyle(color: secondaryColor)),
                trailing: const Icon(Icons.book, color: secondaryColor),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Horror_book_add()),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            ListTile(
                title: const Text("Romantic_Book_add", style: TextStyle(color: secondaryColor)),
                subtitle: const Text("Add a new Romantic book", style: TextStyle(color: secondaryColor)),
                trailing: const Icon(Icons.book, color: secondaryColor),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Romantic_book_add()),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            ListTile(
                title: const Text("Action_Book_add", style: TextStyle(color: secondaryColor)),
                subtitle: const Text("Add a new Action book", style: TextStyle(color: secondaryColor)),
                trailing: const Icon(Icons.book, color: secondaryColor),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Action_book_add()),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            ListTile(
                title: const Text("about App",
                     style: TextStyle(color: secondaryColor) ),
                subtitle: const Text("info about our app", style: TextStyle(color: secondaryColor)),
                trailing: const Icon(Icons.info, color: secondaryColor),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const appInfoScreen()),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            ListTile(
                title: const Text("about Team", style: TextStyle(color: secondaryColor)),
                subtitle: const Text("info about our team" , style: TextStyle(color: secondaryColor)),
                trailing: const Icon(Icons.info, color: secondaryColor),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const teamInfoScreen()),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            ListTile(
                title: const Text("log out" , style: TextStyle(color: secondaryColor)),
                subtitle: const Text("iog out from app", style: TextStyle(color: secondaryColor)),
                trailing: const Icon(Icons.exit_to_app, color: secondaryColor),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const signinpage()),
                  );
                })
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: secondaryColor,
          onTap: onIndexChange,
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 35), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 35), label: 'Profile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu, size: 35), label: 'Menu')
          ]),
    );
  }
}
