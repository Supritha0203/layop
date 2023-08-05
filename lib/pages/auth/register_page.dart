import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:layop2/pages/auth/login_page.dart';
import 'package:layop2/pages/student_home.dart';
import 'package:layop2/service/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String error = "";
  bool loading = false;

  void registerStudent() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
        error = "";
      });
      final email = _emailController.text;
      final password = _passwordController.text;
      final name = _nameController.text;
      final confirmPassword = _confirmPasswordController.text;
      if (password == confirmPassword) {
        try {
          UserCredential userCredential =
              await AuthService.signUp(email: email, password: password);

          await FirebaseFirestore.instance
              .collection('student')
              .doc(email)
              .set({
            'name': name,
            'email': email,
            'role': 'student',
            'uid': userCredential.user!.uid,
            'age': int.parse(_ageController.text),
            'assessments':[],
          });
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const StudentHome()));
        } catch (e) {
          log(e.toString());
          setState(() {
            error = e.toString();
            loading = false;
          });
        }
        setState(() {
          loading = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Passwords do not match')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text("Register"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your name";
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _ageController,
              decoration: const InputDecoration(
                hintText: "Age",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your age";
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your email";
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your password";
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(
                hintText: "Confirm Password",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your confirm password";
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            if (!loading)
              ElevatedButton(
                onPressed: registerStudent,
                child: const Text("Register"),
              ),
            if (loading) const Center(child: CircularProgressIndicator()),
            if (error.isNotEmpty)
              Text(
                error,
                style: TextStyle(color: Colors.red.shade500),
              ),
            TextButton(
                onPressed: () async {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: const Text("Already have an account? Login")),
          ],
        ),
      ),
    );
  }
}
