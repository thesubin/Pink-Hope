import 'dart:io';

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

    Future<bool> addData(blogData) async {
    try{
    await firestore.collection("blogs").add(blogData).catchError((e) {
      print(e);
    });
    return true;
    }
    catch(e){
      return false;
    }

  }

   Future<void> createUser(email,name) async {
    firestore.collection("users").add({'name':name,"email":email}).catchError((e) {
      print(e);
    });
  }

  Future<List> getBlogs() async {
       QuerySnapshot querySnapshot; 
   List docs = [];

     try {
    
           querySnapshot =
          await firestore.collection('blogs').orderBy('timestamp').get();
          print(querySnapshot);
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
     
          Map a = { "desc": doc["desc"],'imgUrl':doc["imgUrl"],'category':doc['category'],'timestamp':doc["timestamp"],'title':doc["title"],'author':doc['author']};
          docs.add(a);
        }
        return docs;
      }
      return [];
     }
     catch (e){
           print(e);
   return [];
     }
  }


  Future<String> getUserName(email) async {
       QuerySnapshot querySnapshot; 
   List docs = [];

     try {
    
           querySnapshot =
          await firestore.collection('users').get();
          print(querySnapshot);
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
            if(doc['email'] == email){
         
          Map a = { "name": doc["name"]};
          docs.add(a);
      
            }
          
              
        }

        return docs.length>0?docs[0]['name']:'John Doe';
      }
      return 'John Doe';
     }
     catch (e){
           print(e);
   return 'John Doe';
     }
  }


}