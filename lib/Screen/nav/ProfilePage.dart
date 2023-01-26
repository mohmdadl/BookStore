import 'package:bookstore/Screen/Fixed.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> data = ["Name: Eslam salah", "Age: 20", "City: zagazig"];

  @override
  void initState() {
    super.initState();
    getEmail();
  }

  getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    String email = prefs.getString("userEmail") ?? "";
    data.add("Email: $email");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 20,
        ),
        CircleAvatar(
            radius: 60,
            child: Image.asset(
              "assets/Untitled-1.png",
              fit: BoxFit.contain,
            )),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.separated(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: secondaryColor,
                  title: Text(data[index],
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          ),
        ),
      ],
    );
  }
}
