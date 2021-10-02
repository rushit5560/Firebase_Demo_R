import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class CrudPage extends StatefulWidget {
  const CrudPage({Key? key}) : super(key: key);

  @override
  _CrudPageState createState() => _CrudPageState();
}

class _CrudPageState extends State<CrudPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Crud Operation'),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: 30),

            GestureDetector(
              onTap: () {
                print('Clicked On Fetch Data Method');
                fetchData();
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Center(
                    child: Text(
                        'Fetch Data',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),

            GestureDetector(
              onTap: () {
                print('Clicked On Add Data Button');
                addData();
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Center(
                    child: Text(
                      'Add Data',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),

            GestureDetector(
              onTap: () {
                print('Clicked On Update Data Method');
                updateData();
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Center(
                    child: Text(
                      'Update Data',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),

            GestureDetector(
              onTap: () {
                print('Clicked On Delete Data Method');
                deleteData();
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Center(
                    child: Text(
                      'Delete  Data',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),

          ],
        ),
      ),
    );
  }

  addData(){
    Map<String, dynamic> demoData = {
      "name": "Rushit123",
      "age": "25"
    };
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('data');
    collectionReference.add(demoData);
  }

  var data;

  fetchData() {
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('data');
    collectionReference.snapshots().listen((snapshot) {

      setState(() {
        data = snapshot.docs[0].data();
      });
     print('Name : ${data['name'].toString()}');
     print('Age : ${data['age'].toString()}');
    });
  }

  deleteData() async{
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('data');
    QuerySnapshot querySnapshot = await collectionReference.get();
    querySnapshot.docs[0].reference.delete();
  }

  updateData() async {
    Map<String, dynamic> updateDatas = {
      "name": "Rushit Baldha123",
      "age": "27"
    };
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('data');
    QuerySnapshot querySnapshot = await collectionReference.get();
    querySnapshot.docs[0].reference.update(updateDatas);
  }
}
