import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key? key, required this.uid}) : super(key: key);
  final String uid;

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  var fullName, userName, emailID;

  final picker = ImagePicker();
  File? _imageFile;

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    // var image = await picker.pickImage(source: ImageSource.gallery);
    print('initiating');

    setState(() {
      _imageFile = File(pickedFile!.path);
      print('Image path $_imageFile');
    });
  }

  Future<void> temp() async {
    var collection = FirebaseFirestore.instance.collection('users');
    var docSnapshot = await collection.doc(widget.uid).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();

      setState(() {
        fullName = data?['full_name'];
        userName = data?['user_name'];
        emailID = data?['email'];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    temp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: fullName == null || userName == null || emailID == null
                ? CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.teal,
                        child: const Text('AH'),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        fullName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Registered Name ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        userName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Registered User Name ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        emailID,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Registered Email ID ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                        ),
                      ),
                      TextButton(
                          onPressed: pickImage, child: Text("Pick Image")),
                      // _imageFile == null
                      //     ? CircularProgressIndicator()
                      //     : Image.file(
                      //         _imageFile!,
                      //         fit: BoxFit.fill,
                      //       )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
