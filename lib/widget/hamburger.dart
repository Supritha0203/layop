// import 'package:flutter/material.dart';
// import 'package:layop/util/app_constant.dart';
// import 'package:layop/widget/k_height.dart';
// import 'package:layop/widget/k_text.dart';
// import '../../../widget/k_button.dart';

// class Hamburger extends StatefulWidget {
//   const Hamburger({super.key});

//   @override
//   State<Hamburger> createState() => _HamburgerState();
// }

// class _HamburgerState extends State<Hamburger> {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(children: [
//         DrawerHeader(
//             decoration: const BoxDecoration(
//               color: AppConstant.primaryColor,
//             ),
//             child: Column(
//               children: const <Widget>[
//                 CircleAvatar(
//                   radius: 50,
//                   child: Icon(Icons.person, size: 45),
//                 ),
//                 KHeight(height: AppConstant.largeSpace),
//                 KText(
//                   size: AppConstant.titleText,
//                   text: "Maria Montessori",
//                   color: AppConstant.whiteTextColor,
//                 )
//               ],
//             )),
//         ListTile(
//           leading: const Icon(Icons.history),
//           title: const Text('History'),
//           onTap: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const HistoryPage(),
//                 ));
//           },
//         ),
//         ListTile(
//           leading: const Icon(Icons.history),
//           title: const Text('IQ test'),
//           onTap: () {
//             // Update the state of the app.
//             // ...
//           },
//         ),
//         ListTile(
//           leading: const Icon(Icons.child_care),
//           title: const Text('Invite a student'),
//           onTap: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const InviteStudent(),
//                 ));
//           },
//         ),
//         ListTile(
//           leading: const Icon(Icons.child_care),
//           title: const Text('Profile'),
//           onTap: () {
//             // Update the state of the app.
//             // ...
//           },
//         ),
//         ListTile(
//           leading: const Icon(Icons.power_settings_new_outlined),
//           title: const Text('Logout'),
//           onTap: () {
//             // Update the state of the app.
//             // ...
//           },
//         ),
//       ]),
//     );
//   }
// }
