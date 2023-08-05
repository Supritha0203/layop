import 'package:flutter/material.dart';
import 'package:layop2/util/app_constant.dart';

class MyTeacher extends StatefulWidget {
  const MyTeacher({super.key});

  @override
  State<MyTeacher> createState() => _MyTeacherState();
}

class _MyTeacherState extends State<MyTeacher> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text("My Teacher"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Card(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                color: AppConstant.secondaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text('Name'),
            ),
          ),
          Card(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                color: AppConstant.secondaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text('Qualification'),
            ),
          ),
          Card(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                color: AppConstant.secondaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text('Experience'),
            ),
          ),
          Card(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                color: AppConstant.secondaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text('Description about themselves'),
            ),
          ),
          Card(
            child: Container(
              height: 200,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                color: AppConstant.secondaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(child: Text('Certificate')),
            ),
          )
        ],
      ),
    ));
  }
}
