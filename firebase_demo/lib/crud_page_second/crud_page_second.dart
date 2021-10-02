import 'package:firebase_demo/crud_page_second/database.dart';
import 'package:firebase_demo/crud_page_second/view.dart';
import 'package:flutter/material.dart';

import 'add.dart';

class CrudPageSecond extends StatefulWidget {
  const CrudPageSecond({Key? key}) : super(key: key);

  @override
  _CrudPageSecondState createState() => _CrudPageSecondState();
}

class _CrudPageSecondState extends State<CrudPageSecond> {

  Database db = Database();
  List docs = [];

  initialise() {
    // db = Database();
    db.initiliase();
    db.read().then((value) {
      setState(() {
        docs = value!;
      });
    });
  }

  @override
  void initState() {
    initialise();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,

      appBar: AppBar(
        title: Text('Crud Operation Second'),
      ),

      body: ListView.builder(
        itemCount: docs.length,
        itemBuilder: (context, index){
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=>
                            View(country: docs[index], db: db)))
                .then((value) {
                  if(value != null){
                    initialise();
                  }
                });
              },
              contentPadding: EdgeInsets.only(right: 30, left: 36),
              title: Text(docs[index]['name']),
              trailing: Text(docs[index]['code']),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, 
              MaterialPageRoute(builder: (context)=> AddPage(db: db)))
          .then((value) {
            if(value != null){
              initialise();
            }
          });
        },
      ),
    );
  }
}
