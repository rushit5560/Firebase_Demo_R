import 'package:firebase_demo/crud_page_second/database.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  AddPage({Key? key, required this.db}) : super(key: key);
  Database db;

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Country Add'),
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
              widget.db.create(nameController.text.trim(), codeController.text.trim());
              Navigator.pop(context,true);
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
