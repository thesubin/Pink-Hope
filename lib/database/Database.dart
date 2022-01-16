import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Database {
  FirebaseFirestore firestore;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  Future<void> create(String name, String description, String image, String url) async {
   QuerySnapshot querySnapshot;
   List docs = [];
    try {
    
      //  querySnapshot = await firestore.collection("notification").get();
        
      // if (querySnapshot.docs.isNotEmpty) {
      //   for (var doc in querySnapshot.docs.toList()) {
      //    if(doc['url'].toString() == url){
      //      docs.add({'id':doc['url']});
      //    }
      //   }

        // if(docs.length == 0){
              await firestore.collection("notification").add({
            'name': name,
            'timestamp': FieldValue.serverTimestamp()
          });
        // }

          // }
    } catch (e) {
      print(e);
    }
  }

}