import 'package:bookstore/Screen/First-Page.dart';
import 'package:bookstore/Screen/Fixed.dart';
import 'package:bookstore/Screen/widgets/My-Button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class signinpage extends StatefulWidget {
  const signinpage({Key? key}) : super(key: key);

  @override
  State<signinpage> createState() => _signinpageState();
}

class _signinpageState extends State<signinpage> {
  bool isPasswordHidden = true;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: secondaryColor,
          iconTheme: IconThemeData(color: primaryColor),
          title: const Text(
            "Sign in",style: TextStyle(color: primaryColor)
          ),
        ),
        body: InkWell(
          onTap: () {
            emailFocusNode.unfocus();
            passwordFocusNode.unfocus();
          },
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: 30,
                      color: secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  cursorColor: secondaryColor,
                  autofocus: true,
                  style: TextStyle(color: secondaryColor),
                  focusNode: emailFocusNode,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.length < 5) {
                      return "email must be more 5 letters";
                    }
                  },
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: const InputDecoration(
                    labelText: "Email",labelStyle: TextStyle(
                      color:secondaryColor),
                    prefixIcon: Icon(Icons.mail,color: secondaryColor,),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  cursorColor: secondaryColor,
                  style: TextStyle(color: secondaryColor),
                  focusNode: passwordFocusNode,
                  textInputAction: TextInputAction.send,
                  obscureText: isPasswordHidden,
                  validator: (value) {
                    if (value!.length < 8) {
                      return "password must be more 8 letters";
                    }
                  },
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                      labelText: "Password",labelStyle: TextStyle(
                      color:secondaryColor),
                      prefixIcon: const Icon(Icons.lock,color: secondaryColor),
                      suffixIcon: IconButton(
                        onPressed: () {
                          isPasswordHidden = !isPasswordHidden;
                          setState(() {});
                        },
                        icon: Icon(isPasswordHidden ? Icons.visibility  : Icons.visibility_off,color: secondaryColor),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyButton(
                  label: "sign in",
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        UserCredential user =
                        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

                        print("user: ${user.user?.email}");
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => FirstPage()),
                        );
                        SnackBar snackBar = const SnackBar(
                          content: Text('Welcome to the app'),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setBool("isLogin", true);
                        prefs.setString("userEmail", "${user.user?.email}");
                        prefs.setString("userId", "${user.user?.uid}");
                      } catch (e) {
                        SnackBar snackBar = const SnackBar(
                          content: Text('Error happend'),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    } else {
                      showErrorMesssage();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showErrorMesssage() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Fix the following errors'),
          actions: <Widget>[
            TextButton(
              child: const Text('okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
