import 'dart:io';
import 'package:layop2/pages/student_home.dart';
import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

final db = FirebaseFirestore.instance;
final storage = FirebaseStorage.instance;

class ProfileSetup extends StatefulWidget {
  const ProfileSetup({super.key});

  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  File? _image;
  final picker = ImagePicker();
  String? data;
  Future chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  Future uploadImage() async {
    Reference storageReference =
        storage.ref().child('images/${Path.basename(_image!.path)}');
    UploadTask uploadTask = storageReference.putFile(_image!);
    await uploadTask;
    print('File Uploaded');
    await storageReference.getDownloadURL().then((fileURL) {
      data = fileURL;
    });
    addFormDataToFirestore(data);
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  void addFormDataToFirestore(dataurl) async {
    print(dataurl);
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? action = prefs.getString('UID');
    try {
      await FirebaseFirestore.instance.collection('users').doc(action).set({
        'FirstName': _firstNameController.text,
        'LastName': _lastNameController.text,
        'PhoneNumber': _numberController.text,
        'ImageURL': dataurl,
      });
      print('Form data added successfully');
    } catch (e) {
      print('Error occurred while adding form data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 25),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _image == null
                ? const CircleAvatar(
                    radius: 50,
                  )
                : Image.file(
                    _image!,
                    height: 200,
                  ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: chooseImage,
              child: Text("choose image"),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'James',
                labelText: 'First Name',
              ),
            ),
            TextFormField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Smith',
                labelText: 'Last Name',
              ),
            ),
            TextFormField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                icon: Icon(Icons.phone),
                hintText: 'Enter a phone number',
                labelText: 'Phone',
              ),
            ),
            Container(
                padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                child: ElevatedButton(
                  child: const Text('submit'),
                  onPressed: () async {
                    uploadImage();
                    Fluttertoast.showToast(
                        msg: "Details saved successfully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 5,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => StudentHome()),
                    );
                  },
                ))
          ],
        ),
      ),
    ));
  }
}
