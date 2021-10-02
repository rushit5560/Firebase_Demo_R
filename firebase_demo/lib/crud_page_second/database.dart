import 'package:cloud_firestore/cloud_firestore.dart';


class Database {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  Future<List?> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];

    try{
      querySnapshot = await firestore.collection('countries').orderBy('timestamp').get();
      if(querySnapshot.docs.isNotEmpty) {
        for(var doc in querySnapshot.docs.toList()){
          Map a = {"id": doc.id, "name":doc['name'], "code": doc['code']};
          docs.add(a);
        }
        return docs;
      }
    } catch(e) {
      print('Read Method Error : $e');
    }

  }

  void update(String id, String name, String code) async {
    try{
      await firestore.collection('countries').doc(id).update(
        {
          "name": name,
          "code": code
        }
      );
    } catch(e){
      print('Update Error : $e');
    }
  }

  void create(String name, String code) async{

    Map<String, dynamic> data = {
      "name": name,
      "code": code,
      "timestamp": FieldValue.serverTimestamp()
    };

    try{
      await firestore.collection('countries').add(data);
    } catch(e) {
      print('Create Method Error : $e');
    }
  }

  void delete(String id) async {
    try{
      await firestore.collection('countries').doc(id).delete();
    } catch(e){
      print('Delete Method Error : $e');
    }
  }

}