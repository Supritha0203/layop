// import 'package:flutter/material.dart';
// import 'package:layop/util/app_constant.dart';

// class SyllabusPage extends StatefulWidget {
//   const SyllabusPage({super.key});

//   @override
//   State<SyllabusPage> createState() => _SyllabusPageState();
// }

// class _SyllabusPageState extends State<SyllabusPage> {
//   Map<String, List<String>> syllabus = {
//     'unit1': ['addition', 'multiplication'],
//     'unit2': ['addition', 'multiplication'],
//   };
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Syllabus'),
//       ),
//       body: ListView.builder(
//         itemBuilder: (ctx, index) {
//           List<Widget> topics = [];

//           for (var i = 0;
//               i < syllabus[syllabus.keys.elementAt(index)]!.length;
//               i++) {
//             topics.add(
//               Container(
//                 margin: const EdgeInsets.only(
//                     left: 20, top: 5, bottom: 5, right: 5),
//                 width: MediaQuery.of(context).size.width,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//                 decoration: BoxDecoration(
//                   color: Colors.purple.shade100,
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 child: Text(syllabus[syllabus.keys.elementAt(index)]![i]),
//               ),
//             );
//           }

//           return Column(
//             children: [
//               Card(
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//                   decoration: BoxDecoration(
//                     color: AppConstant.secondaryColor,
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: Text(syllabus.keys.elementAt(index)),
//                 ),
//               ),
//               ...topics
//             ],
//           );
//         },
//         itemCount: syllabus.keys.length,
//       ),
//     );
//   }
// }
