import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:layop2/pages/quiz/attempt_exam_page.dart';
import 'package:layop2/util/app_constant.dart';
import 'package:layop2/widget/k_text.dart';

class Ongoing extends StatefulWidget {
  const Ongoing({super.key});

  @override
  State<Ongoing> createState() => _OngoingState();
}

class _OngoingState extends State<Ongoing> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Map<String, dynamic>> ongoingAssessments = [];
  String error = "";

  Future getData() async {
    try {
      final email = FirebaseAuth.instance.currentUser!.email;
      log(email.toString());
      final data = await _firestore.collection('student').doc(email).get();
      final assessments = data['assessments'];
      final snapshot = await FirebaseFirestore.instance
          .collection('assessment')
          // .where('id', whereNotIn: assessments)
          .get();
      // if (assessments.length == 0) {
      //   assessments.add('no');
      // }
      if (ongoingAssessments.length > 0) {
        // setState(() {
        ongoingAssessments.clear();
        // });
      }
      final docs = snapshot.docs;
      for (final doc in docs) {
        final data = doc.data();
        ongoingAssessments.add(data);
      }
    } catch (e) {
      log(e.toString());
      setState(() => {error = e.toString()});
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (ctx, data) {
        if (data.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (data.hasError) {
          return Center(child: Text(error));
        }
        return ListView.builder(
          itemCount: ongoingAssessments.length,
          itemBuilder: (ctx, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AttemptExamPage(
                                data: ongoingAssessments[index]['data'],
                                time: ongoingAssessments[index]['time'],
                                id: ongoingAssessments[index]['id'],
                              )));
                },
                title: KText(
                  text: ongoingAssessments[index]['title'],
                  color: AppConstant.primaryColor,
                ),
              ),
            );
          },
        );
      },
      future: getData(),
    );
  }
}
