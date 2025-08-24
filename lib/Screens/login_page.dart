// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//   @override
//   LoginPageState createState() => LoginPageState();
// }

// class LoginPageState extends State<LoginPage> {
//   String textField1 = '';
//   String textField2 = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           constraints: const BoxConstraints.expand(),
//           color: const Color(0xFFFFFFFF),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Container(
//                   color: const Color(0xFF000000),
//                   width: double.infinity,
//                   height: double.infinity,
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         IntrinsicHeight(
//                           child: Container(
//                             width: double.infinity,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 IntrinsicHeight(
//                                   child: Container(
//                                     padding: const EdgeInsets.only(top: 10, bottom: 59, left: 10, right: 113),
//                                     width: double.infinity,
//                                     decoration: BoxDecoration(
//                                       image: DecorationImage(
//                                         image: NetworkImage("https://storage.googleapis.com/tagjs-prod.appspot.com/v1/E2fuCv54gY/spdi8bch_expires_30_days.png"),
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         InkWell(
//                                           onTap: () { print('Pressed'); },
//                                           child: IntrinsicWidth(
//                                             child: IntrinsicHeight(
//                                               child: Container(
//                                                 decoration: BoxDecoration(
//                                                   border: Border.all(
//                                                     color: Color(0xFFFFFFFF),
//                                                     width: 2,
//                                                   ),
//                                                   borderRadius: BorderRadius.circular(524),
//                                                   color: Color(0xFFFFA838),
//                                                 ),
//                                                 padding: const EdgeInsets.only(top: 11, bottom: 11, left: 14, right: 14),
//                                                 child: Column(
//                                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                                   children: [
//                                                     Text(
//                                                       "←",
//                                                       style: TextStyle(
//                                                         color: Color(0xFFFFFFFF),
//                                                         fontSize: 24,
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Container(
//                                           margin: const EdgeInsets.only(top: 49),
//                                           width: 165,
//                                           height: 165,
//                                           child: Image.network(
//                                             "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/E2fuCv54gY/pgyc9ctp_expires_30_days.png",
//                                             fit: BoxFit.fill,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 IntrinsicHeight(
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                         color: Color(0xFF000000),
//                                         width: 3,
//                                       ),
//                                       borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(30),
//                                         topRight: Radius.circular(30),
//                                       ),
//                                       color: Color(0xFFFAF1DF),
//                                     ),
//                                     padding: const EdgeInsets.only(top: 14, bottom: 127, left: 19, right: 19),
//                                     width: double.infinity,
//                                     child: Column(
//                                       children: [
//                                         IntrinsicHeight(
//                                           child: Container(
//                                             width: double.infinity,
//                                             child: Row(
//                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                               crossAxisAlignment: CrossAxisAlignment.start,
//                                               children: [
//                                                 Container(
//                                                   width: 10,
//                                                   height: 10,
//                                                   child: Image.network(
//                                                     "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/E2fuCv54gY/hvie480v_expires_30_days.png",
//                                                     fit: BoxFit.fill,
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   width: 10,
//                                                   height: 10,
//                                                   child: Image.network(
//                                                     "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/E2fuCv54gY/jyqlzlqo_expires_30_days.png",
//                                                     fit: BoxFit.fill,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                         Container(
//                                           margin: const EdgeInsets.only(bottom: 5),
//                                           child: Text(
//                                             "Log in",
//                                             style: TextStyle(
//                                               color: Color(0xFF000000),
//                                               fontSize: 30,
//                                             ),
//                                           ),
//                                         ),
//                                         Container(
//                                           color: Color(0xFF7D7B7B),
//                                           margin: const EdgeInsets.only(bottom: 18, left: 21, right: 21),
//                                           height: 1,
//                                           width: double.infinity,
//                                           child: SizedBox(),
//                                         ),
//                                         IntrinsicHeight(
//                                           child: Container(
//                                             margin: const EdgeInsets.only(bottom: 24, left: 21, right: 21),
//                                             width: double.infinity,
//                                             child: Column(
//                                               crossAxisAlignment: CrossAxisAlignment.start,
//                                               children: [
//                                                 Container(
//                                                   margin: const EdgeInsets.only(bottom: 10),
//                                                   child: Text(
//                                                     "Username",
//                                                     style: TextStyle(
//                                                       color: Color(0xFF000000),
//                                                       fontSize: 14,
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 IntrinsicHeight(
//                                                   child: Container(
//                                                     alignment: Alignment.center,
//                                                     decoration: BoxDecoration(
//                                                       border: Border.all(
//                                                         color: Color(0xFF282626),
//                                                         width: 2,
//                                                       ),
//                                                       borderRadius: BorderRadius.circular(12),
//                                                       color: Color(0xFFFFFFFF),
//                                                     ),
//                                                     padding: const EdgeInsets.only(top: 8, bottom: 8, left: 14, right: 28),
//                                                     width: double.infinity,
//                                                     child: TextField(
//                                                       style: TextStyle(
//                                                         color: Color(0xFF8B8B8B),
//                                                         fontSize: 11,
//                                                       ),
//                                                       onChanged: (value) { 
//                                                         setState(() { textField1 = value; });
//                                                       },
//                                                       decoration: InputDecoration(
//                                                         hintText: "Enter Username",
//                                                         isDense: true,
//                                                         contentPadding: EdgeInsets.symmetric(vertical: 0),
//                                                         border: InputBorder.none,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
