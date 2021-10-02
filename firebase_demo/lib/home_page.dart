import 'package:firebase_demo/crud_page.dart';
import 'package:firebase_demo/crud_page_second/crud_page_second.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    // var db = FirebaseFirestore.instance;

    return Scaffold(

      drawer: customDrawer(),

      appBar: AppBar(
        title: Text('Firebase Demo'),
      ),

      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('bandnames').snapshots(),
              builder: (context, snapshot){
                if(!snapshot.hasData){
                  return Center(child: const Text('Loading...'));
                } else {
                  return ListView.builder(
                    itemExtent: 80,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index){
                      return _buildListItem(context, snapshot.data!.docs[index], index);
                    },
                  );
                }
              },
            ),
          ),
          SizedBox(height: 30),

          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> CrudPage()));
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'Crud Operation Screen',
                  style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 15
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 30),

          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> CrudPageSecond()));
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Other Crud Operation Screen',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context,DocumentSnapshot document,int index){
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(
              document['name'],
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xffddddff)
            ),
            child: Text(
              document['votes'].toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ],
      ),
      onTap: () {
        print('Before Update the Votes : ${document['votes']}');

        // Method 1
        /*document.reference.update({
          'votes': document['votes'] + 1
        });*/

        // Method 2
        FirebaseFirestore.instance.runTransaction((transaction) async {
          DocumentSnapshot freshSnap = await transaction.get(document.reference);
          transaction.update(freshSnap.reference, {
            'votes': freshSnap['votes'] + 1,
          });
        });

        print('Updated Votes : ${document['votes']}');
      },
    );
  }
}

