// import 'package:bookstore/Screen/First-Page.dart';
// import 'package:bookstore/Screen/Fixed.dart';
// import 'package:bookstore/Screen/prodect.dart';
// import 'package:flutter/material.dart';
// import 'package:search_page/search_page.dart';

// class Search_page_screen extends StatelessWidget {
//   static List<prodect> prodects = [
//     prodect(
//         prodectId: 100,
//         img: 'https://m.media-amazon.com/images/I/619m8rLBQSL.jpg',
//         title: 'laptop hp zbook g3',
//         name: 'hp zbook g3'),
//     prodect(
//         prodectId: 101,
//         img:
//             'https://mobizil.com/wp-content/uploads/2019/02/Samsung-Galaxy-S10-Plus-Black.jpg',
//         title: 'Samsung-Galaxy-S10-Plus-Black',
//         name: 'Samsung S10'),
//     prodect(
//         prodectId: 102,
//         img:
//             'https://review-plus.com/wp-content/uploads/2020/08/Apple-iPhone-12-Pro-Max-1.jpg',
//         title: 'Apple-iPhone-12-Pro-Max',
//         name: 'iPhone 12 Pro Max'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: secondaryColor,
//         automaticallyImplyLeading: false,
//         leading: IconButton(
//           onPressed: () => Navigator.pushReplacement(
//               context, MaterialPageRoute(builder: (context) => FirstPage())),
//           icon: const Icon(Icons.arrow_back, color: primaryColor),
//         ),
//         title: const Text('Search Page', style: TextStyle(color: primaryColor)),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: secondaryColor,
//         foregroundColor: primaryColor,
//         tooltip: 'Search product',
//         onPressed: () => showSearch(
//           context: context,
//           delegate: SearchPage<prodect>(
//             barTheme: ThemeData(
//               appBarTheme: AppBarTheme(
//                 backgroundColor: secondaryColor,
//                 iconTheme: IconThemeData(color: primaryColor),
//               ),
//               scaffoldBackgroundColor: primaryColor,
//             ),
//             onQueryUpdate: (s) => print(s),
//             items: prodects,
//             searchLabel: 'Search products',
//             suggestion: const Center(
//               child: Text(
//                 'Filter products by name',
//                 style: const TextStyle(color: secondaryColor),
//               ),
//             ),
//             failure: const Center(
//               child: Text(
//                 'No products found :()',
//                 style: const TextStyle(color: secondaryColor),
//               ),
//             ),
//             filter: (prodects) => [prodects.name, prodects.title],
//             builder: (prodects) => ListTile(
//               title: Text(
//                 prodects.name,
//                 style: const TextStyle(color: secondaryColor),
//               ),
//               subtitle: Text(
//                 prodects.title,
//                 style: const TextStyle(color: secondaryColor),
//               ),
//               trailing: Image(image: NetworkImage(prodects.img)),
//             ),
//           ),
//         ),
//         child: const Icon(Icons.search),
//       ),
//     );
//   }
// }
