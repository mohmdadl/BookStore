import 'package:bookstore/Screen/Fixed.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Homepage_Screen extends StatefulWidget {
  const Homepage_Screen({Key? key}) : super(key: key);

  @override
  State<Homepage_Screen> createState() => _Homepage_ScreenState();
}

class _Homepage_ScreenState extends State<Homepage_Screen> {
  List<QueryDocumentSnapshot<Object?>> ActionBookshow = [];
  List<QueryDocumentSnapshot<Object?>> HorrorBookshow = [];
  List<QueryDocumentSnapshot<Object?>> RomanticBookshow = [];
  List<QueryDocumentSnapshot<Object?>> Bookshow = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getHorrorBook();
    getRomanticBook();
    getActionBook();
    getBook();
  }

  //Horror book
  getHorrorBook() async {
    CollectionReference Horror_Book =
        FirebaseFirestore.instance.collection('Horror_Book');
    QuerySnapshot data = await Horror_Book.get();
    HorrorBookshow = data.docs;
    loading = false;
    setState(() {});
  }

  getRomanticBook() async {
    CollectionReference Romantic_Book =
        FirebaseFirestore.instance.collection('Romantic_Book');
    QuerySnapshot data = await Romantic_Book.get();
    RomanticBookshow = data.docs;
    loading = false;
    setState(() {});
  }

  getActionBook() async {
    CollectionReference Action_Book =
        FirebaseFirestore.instance.collection('Action_Book');
    QuerySnapshot data = await Action_Book.get();
    ActionBookshow = data.docs;
    loading = false;
    setState(() {});
  }

  getBook() async {
    CollectionReference Book = FirebaseFirestore.instance.collection('Book');
    QuerySnapshot data = await Book.get();
    Bookshow = data.docs;
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              child: Image.asset(
                "assets/download.jpg",
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Romantic book
          Container(
            margin: const EdgeInsets.symmetric(vertical: 25.0),
            height: MediaQuery.of(context).size.height / 2.4,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: RomanticBookshow.length,
              separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Image.asset(
                        "${RomanticBookshow[index]['image']}",
                        fit: BoxFit.contain,
                        width: MediaQuery.of(context).size.width / 2,
                      ),
                      Container(
                        color: secondaryColor,
                        width: MediaQuery.of(context).size.width / 2,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          "${RomanticBookshow[index]['name']}",
                          style: const TextStyle(
                              color: primaryColor, fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          // Horror book
          Container(
            margin: const EdgeInsets.symmetric(vertical: 25.0),
            height: MediaQuery.of(context).size.height / 2.4,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: HorrorBookshow.length,
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Image.asset(
                        "${HorrorBookshow[index]['image']}",
                        fit: BoxFit.contain,
                        width: MediaQuery.of(context).size.width / 2,
                      ),
                      Container(
                        color: secondaryColor.withOpacity(.8),
                        width: MediaQuery.of(context).size.width / 2,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          "${HorrorBookshow[index]['name']}",
                          style: const TextStyle(
                              color: primaryColor, fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          // Action book
          Container(
            margin: const EdgeInsets.symmetric(vertical: 25.0),
            height: MediaQuery.of(context).size.height / 2.4,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: ActionBookshow.length,
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Image.asset(
                        "${ActionBookshow[index]['image']}",
                        fit: BoxFit.contain,
                        width: MediaQuery.of(context).size.width / 2,
                      ),
                      Container(
                        color: secondaryColor.withOpacity(.8),
                        width: MediaQuery.of(context).size.width / 2,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          "${ActionBookshow[index]['name']}",
                          style: const TextStyle(
                              color: primaryColor, fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 25.0),
            height: MediaQuery.of(context).size.height / 2.4,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: Bookshow.length,
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Image.asset(
                        "${Bookshow[index]['image']}",
                        fit: BoxFit.contain,
                        width: MediaQuery.of(context).size.width / 2,
                      ),
                      Container(
                        color: secondaryColor.withOpacity(.8),
                        width: MediaQuery.of(context).size.width / 2,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          "${Bookshow[index]['name']}",
                          style: const TextStyle(
                              color: primaryColor, fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
//طريقه كنت استعملتها عشان اعرض الحاجه بس طبعا لما اعملها باستخدام الداتا بيز احلي و انضف
// Container(
// margin: const EdgeInsets.symmetric(vertical: 10.0),
// height: 250.0,
// child: ListView(
// // This next line does the trick.
// scrollDirection: Axis.horizontal,
// children: <Widget>[
// SizedBox(
// width: 240.0,
// child: Image.asset(
// "assets/images (7).jpg",
// fit: BoxFit.cover,
// )),
// SizedBox(
// width: 240.0,
// child: Image.asset(
// "assets/download (13).jpg",
// fit: BoxFit.cover,
// )),
// SizedBox(
// width: 240.0,
// child: Image.asset(
// "assets/download (14).jpg",
// fit: BoxFit.cover,
// )),
// SizedBox(
// width: 240.0,
// child: Image.asset(
// "assets/download (15).jpg",
// fit: BoxFit.cover,
// ),
// ),
// SizedBox(
// width: 240.0,
// child: Image.asset(
// "assets/download (16).jpg",
// fit: BoxFit.cover,
// )),
// SizedBox(
// width: 240.0,
// child: Image.asset(
// "assets/download (17).jpg",
// fit: BoxFit.cover,
// )),
// SizedBox(
// width: 240.0,
// child: Image.asset(
// "assets/download (18).jpg",
// fit: BoxFit.cover,
// )),
// SizedBox(
// width: 240.0,
// child: Image.asset(
// "assets/download (19).jpg",
// fit: BoxFit.cover,
// )),
// SizedBox(
// width: 370.0,
// child: Image.asset(
// "assets/download (20).jpg",
// fit: BoxFit.cover,
// )),
// ],
// ),
// ),
