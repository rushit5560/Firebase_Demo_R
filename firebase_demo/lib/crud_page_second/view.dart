import 'package:firebase_demo/crud_page_second/database.dart';
import 'package:flutter/material.dart';

class View extends StatefulWidget {
  View({Key? key, required this.country, required this.db}) : super(key: key);
  Map country;
  Database db;

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {

  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  @override
  void initState() {
    print('Country Name : ${widget.country}');
    nameController.text = widget.country['name'];
    codeController.text = widget.country['code'];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,

      appBar: AppBar(
        title: Text('Country View'),

        actions: [
          GestureDetector(
            onTap: () {
              widget.db.delete(widget.country['id']);
              Navigator.pop(context, true);
            },
              child: Icon(Icons.delete_rounded),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: inputDecoration('Country Name'),
              ),

              SizedBox(height: 20),

              TextFormField(
                controller: codeController,
                decoration: inputDecoration('Country Code'),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: BottomAppBar(
          color: Colors.transparent,
          child: MaterialButton(
            onPressed: () {
              widget.db.update(widget.country['id'], nameController.text, codeController.text);
              Navigator.pop(context, true);
            },
            color: Colors.black,
            child: Text(
                'Save',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),

    );
  }

  InputDecoration inputDecoration(String labelText){
    return InputDecoration(
      focusColor: Colors.white,
      labelStyle: TextStyle(color: Colors.white),
      labelText: labelText,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(
          color: Colors.black, width: 2
        ),
      ),
    );
  }
}
